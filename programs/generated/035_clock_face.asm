; clock_face.asm -- Clock face with hour marks and hands at 3 o'clock
; Center at (128,128), radius 100, dark background

; Dark blue background
LDI r0, 0x111122
FILL r0

; Clock face circle - white outline
LDI r0, 128
LDI r1, 128
LDI r2, 100
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

; Hour marks (LINE from inner radius 85 to outer radius 100)
; r0=cx=128, r1=cy=128, r3=color=white

; 12 o'clock: (128,43) to (128,28)
LDI r4, 128
LDI r5, 43
LDI r6, 128
LDI r7, 28
LINE r4, r5, r6, r7, r3

; 1 o'clock: (202,56) to (215,41)
LDI r4, 202
LDI r5, 56
LDI r6, 215
LDI r7, 41
LINE r4, r5, r6, r7, r3

; 2 o'clock: (202,86) to (215,78)
LDI r4, 202
LDI r5, 86
LDI r6, 215
LDI r7, 78
LINE r4, r5, r6, r7, r3

; 3 o'clock: (213,128) to (228,128)
LDI r4, 213
LDI r5, 128
LDI r6, 228
LDI r7, 128
LINE r4, r5, r6, r7, r3

; 4 o'clock: (202,171) to (215,178)
LDI r4, 202
LDI r5, 171
LDI r6, 215
LDI r7, 178
LINE r4, r5, r6, r7, r3

; 5 o'clock: (202,202) to (215,215)
LDI r4, 202
LDI r5, 202
LDI r6, 215
LDI r7, 215
LINE r4, r5, r6, r7, r3

; 6 o'clock: (128,213) to (128,228)
LDI r4, 128
LDI r5, 213
LDI r6, 128
LDI r7, 228
LINE r4, r5, r6, r7, r3

; 7 o'clock: (56,202) to (41,215)
LDI r4, 56
LDI r5, 202
LDI r6, 41
LDI r7, 215
LINE r4, r5, r6, r7, r3

; 8 o'clock: (56,171) to (41,178)
LDI r4, 56
LDI r5, 171
LDI r6, 41
LDI r7, 178
LINE r4, r5, r6, r7, r3

; 9 o'clock: (43,128) to (28,128)
LDI r4, 43
LDI r5, 128
LDI r6, 28
LDI r7, 128
LINE r4, r5, r6, r7, r3

; 10 o'clock: (56,86) to (41,78)
LDI r4, 56
LDI r5, 86
LDI r6, 41
LDI r7, 78
LINE r4, r5, r6, r7, r3

; 11 o'clock: (86,56) to (73,41)
LDI r4, 86
LDI r5, 56
LDI r6, 73
LDI r7, 41
LINE r4, r5, r6, r7, r3

; Hour hand - short thick line pointing to 3 (red)
LDI r3, 0xFF3333
LDI r4, 128
LDI r5, 128
LDI r6, 195
LDI r7, 128
LINE r4, r5, r6, r7, r3
; Extra line below for thickness
LDI r5, 130
LDI r7, 130
LINE r4, r5, r6, r7, r3
LDI r5, 126
LDI r7, 126
LINE r4, r5, r6, r7, r3

; Minute hand - long line pointing to 12 (white)
LDI r3, 0xFFFFFF
LDI r4, 128
LDI r5, 128
LDI r6, 128
LDI r7, 38
LINE r4, r5, r6, r7, r3
; Extra lines for thickness
LDI r4, 130
LDI r6, 130
LINE r4, r5, r6, r7, r3
LDI r4, 126
LDI r6, 126
LINE r4, r5, r6, r7, r3

; Center dot - small red circle
LDI r0, 128
LDI r1, 128
LDI r2, 5
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3

HALT
