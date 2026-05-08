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
    LDI r8, 0x000033
    FILL r8

    ; Draw title bar
    LDI r6, 0
    LDI r13, 0
    LDI r14, 256
    LDI r15, 16
    LDI r8, 0x003366
    RECTF r6, r13, r14, r15, r8

    ; Draw status bar at bottom
    LDI r6, 0
    LDI r13, 240
    LDI r14, 256
    LDI r15, 16
    LDI r8, 0x003366
    RECTF r6, r13, r14, r15, r8

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r6, screen_path
    LDI r13, 0
    OPEN r6, r13
    ; r3 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r6, kb_path
    LDI r13, 0
    OPEN r6, r13
    ; r3 = 0xE001 (keyboard fd), save to r11
    MOV r11, r3

    ; /dev/audio -> fd 0xE002
    LDI r6, audio_path
    LDI r13, 0
    OPEN r6, r13
    ; r3 = 0xE002 (audio fd), save to r4
    MOV r4, r3

    ; /dev/net -> fd 0xE003
    LDI r6, net_path
    LDI r13, 0
    OPEN r6, r13
    ; r3 = 0xE003 (net fd), save to r9
    MOV r9, r3

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r7, 0xE000
    LDI r12, 0
    LDI r1, 0
    IOCTL r7, r12, r1
    ; r3 = 256 (width), store it
    LDI r20, result
    STORE r20, r3

    ; Get screen height (cmd=1) -- should return 256
    LDI r7, 0xE000
    LDI r12, 1
    LDI r1, 0
    IOCTL r7, r12, r1
    ; r3 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r7, 0xE001
    LDI r12, 1
    LDI r1, 1
    IOCTL r7, r12, r1
    ; r3 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r7, 0xE002
    LDI r12, 1
    LDI r1, 50
    IOCTL r7, r12, r1
    ; r3 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r7, 0xE003
    LDI r12, 0
    LDI r1, 0
    IOCTL r7, r12, r1
    ; r3 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r6, key_buf
    LDI r13, 1
    READ r11, r6, r13
    ; r3 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r14, 0
    CMP r3, r14
    JZ r3, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r3
    LDI r14, 255
    AND r3, r14       ; r3 = random x (0-255)

    RAND r6
    AND r6, r14       ; r6 = random y (0-255)

    RAND r13
    AND r13, r14       ; r13 = random color component

    ; Make it brighter (add 0x111111)
    LDI r14, 0x111111
    ADD r13, r14

    ; Draw pixel directly
    PSETI r3, r6, r13

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r6, pixel_buf
    LDI r13, 440
    STORE r6, r13
    LDI r13, 1
    ADD r6, r13       ; r6 = pixel_buf + 1
    LDI r13, 50
    STORE r6, r13
    LDI r6, pixel_buf
    LDI r13, 2
    WRITE r4, r6, r13

skip:
    FRAME
    JMP loop
