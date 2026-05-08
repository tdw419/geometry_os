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
    LDI r7, 0x000033
    FILL r7

    ; Draw title bar
    LDI r9, 0
    LDI r2, 0
    LDI r12, 256
    LDI r0, 16
    LDI r7, 0x003366
    RECTF r9, r2, r12, r0, r7

    ; Draw status bar at bottom
    LDI r9, 0
    LDI r2, 240
    LDI r12, 256
    LDI r0, 16
    LDI r7, 0x003366
    RECTF r9, r2, r12, r0, r7

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r9, screen_path
    LDI r2, 0
    OPEN r9, r2
    ; r15 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r9, kb_path
    LDI r2, 0
    OPEN r9, r2
    ; r15 = 0xE001 (keyboard fd), save to r3
    MOV r3, r15

    ; /dev/audio -> fd 0xE002
    LDI r9, audio_path
    LDI r2, 0
    OPEN r9, r2
    ; r15 = 0xE002 (audio fd), save to r1
    MOV r1, r15

    ; /dev/net -> fd 0xE003
    LDI r9, net_path
    LDI r2, 0
    OPEN r9, r2
    ; r15 = 0xE003 (net fd), save to r6
    MOV r6, r15

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r5, 0xE000
    LDI r13, 0
    LDI r8, 0
    IOCTL r5, r13, r8
    ; r15 = 256 (width), store it
    LDI r20, result
    STORE r20, r15

    ; Get screen height (cmd=1) -- should return 256
    LDI r5, 0xE000
    LDI r13, 1
    LDI r8, 0
    IOCTL r5, r13, r8
    ; r15 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r5, 0xE001
    LDI r13, 1
    LDI r8, 1
    IOCTL r5, r13, r8
    ; r15 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r5, 0xE002
    LDI r13, 1
    LDI r8, 50
    IOCTL r5, r13, r8
    ; r15 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r5, 0xE003
    LDI r13, 0
    LDI r8, 0
    IOCTL r5, r13, r8
    ; r15 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r9, key_buf
    LDI r2, 1
    READ r3, r9, r2
    ; r15 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r12, 0
    CMP r15, r12
    JZ r15, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r15
    LDI r12, 255
    AND r15, r12       ; r15 = random x (0-255)

    RAND r9
    AND r9, r12       ; r9 = random y (0-255)

    RAND r2
    AND r2, r12       ; r2 = random color component

    ; Make it brighter (add 0x111111)
    LDI r12, 0x111111
    ADD r2, r12

    ; Draw pixel directly
    PSETI r15, r9, r2

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r9, pixel_buf
    LDI r2, 440
    STORE r9, r2
    LDI r2, 1
    ADD r9, r2       ; r9 = pixel_buf + 1
    LDI r2, 50
    STORE r9, r2
    LDI r9, pixel_buf
    LDI r2, 2
    WRITE r1, r9, r2

skip:
    FRAME
    JMP loop
