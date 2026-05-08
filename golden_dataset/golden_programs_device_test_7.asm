; DESCRIPTION: This GeOS assembly code initializes and tests device drivers for a screen, keyboard, audio, and network interface. It opens each device file, queries their properties using IOCTL commands, and enters an interactive loop where it reads key presses from the keyboard to randomly draw pixels on the screen while emitting a beep sound through the audio device.

; device_test.asm -- Phase 28: Device Driver Abstraction demo
; Opens all 4 device files, uses IOCTL to query them,
; reads from /dev/keyboard, writes pixels to /dev/screen.
;
; Controls: Press any key to draw a pixel at a random position
; Opcodes: OPEN, READ, WRITE, IOCTL, LDI, LOAD, STORE, RAND, FRAME, HALT

; -- Data area --
.org 0xD00
screen_path:
    .db "/dev/screen", 0
kb_path:
    .db "/dev/keyboard", 0
audio_path:
    .db "/dev/audio", 0
net_path:
    .db "/dev/net", 0
pixel_buf:
    .db 0, 0, 0   ; x, y, color triplet for screen write
key_buf:
    .db 0         ; buffer for keyboard read
result:
    .db 0         ; stores ioctl results

; -- Main program --
.org 0x000
    ; Fill screen with dark blue background
    LDI r6, 0x000033
    FILL r6

    ; Draw title bar
    LDI r15, 0
    LDI r12, 0
    LDI r7, 256
    LDI r10, 16
    LDI r6, 0x003366
    RECTF r15, r12, r7, r10, r6

    ; Draw status bar at bottom
    LDI r15, 0
    LDI r12, 240
    LDI r7, 256
    LDI r10, 16
    LDI r6, 0x003366
    RECTF r15, r12, r7, r10, r6

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r15, screen_path
    LDI r12, 0
    OPEN r15, r12
    ; r13 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r15, kb_path
    LDI r12, 0
    OPEN r15, r12
    ; r13 = 0xE001 (keyboard fd), save to r3
    MOV r3, r13

    ; /dev/audio -> fd 0xE002
    LDI r15, audio_path
    LDI r12, 0
    OPEN r15, r12
    ; r13 = 0xE002 (audio fd), save to r1
    MOV r1, r13

    ; /dev/net -> fd 0xE003
    LDI r15, net_path
    LDI r12, 0
    OPEN r15, r12
    ; r13 = 0xE003 (net fd), save to r0
    MOV r0, r13

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r2, 0xE000
    LDI r8, 0
    LDI r9, 0
    IOCTL r2, r8, r9
    ; r13 = 256 (width), store it
    LDI r20, result
    STORE r20, r13

    ; Get screen height (cmd=1) -- should return 256
    LDI r2, 0xE000
    LDI r8, 1
    LDI r9, 0
    IOCTL r2, r8, r9
    ; r13 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r2, 0xE001
    LDI r8, 1
    LDI r9, 1
    IOCTL r2, r8, r9
    ; r13 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r2, 0xE002
    LDI r8, 1
    LDI r9, 50
    IOCTL r2, r8, r9
    ; r13 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r2, 0xE003
    LDI r8, 0
    LDI r9, 0
    IOCTL r2, r8, r9
    ; r13 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r15, key_buf
    LDI r12, 1
    READ r3, r15, r12
    ; r13 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r7, 0
    CMP r13, r7
    JZ r13, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r13
    LDI r7, 255
    AND r13, r7       ; r13 = random x (0-255)

    RAND r15
    AND r15, r7       ; r15 = random y (0-255)

    RAND r12
    AND r12, r7       ; r12 = random color component

    ; Make it brighter (add 0x111111)
    LDI r7, 0x111111
    ADD r12, r7

    ; Draw pixel directly
    PSETI r13, r15, r12

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r15, pixel_buf
    LDI r12, 440
    STORE r15, r12
    LDI r12, 1
    ADD r15, r12       ; r15 = pixel_buf + 1
    LDI r12, 50
    STORE r15, r12
    LDI r15, pixel_buf
    LDI r12, 2
    WRITE r1, r15, r12

skip:
    FRAME
    JMP loop
