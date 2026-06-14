; clock_face.asm -- Analog clock face showing 3:00
; Circle with 12 hour marks, hour hand at 3, minute hand at 12

; Clock face circle (center 128,128, radius 100)
LDI r0, 128
LDI r1, 128
LDI r2, 100
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

; Hour marks color
LDI r15, 0xFFFFFF

; Hour 12 (top)
LDI r4, 128
LDI r5, 43
LDI r6, 128
LDI r7, 33
LINE r4, r5, r6, r7, r15

; Hour 1
LDI r4, 170
LDI r5, 54
LDI r6, 176
LDI r7, 46
LINE r4, r5, r6, r7, r15

; Hour 2
LDI r4, 202
LDI r5, 86
LDI r6, 210
LDI r7, 81
LINE r4, r5, r6, r7, r15

; Hour 3
LDI r4, 213
LDI r5, 128
LDI r6, 223
LDI r7, 128
LINE r4, r5, r6, r7, r15

; Hour 4
LDI r4, 202
LDI r5, 170
LDI r6, 210
LDI r7, 176
LINE r4, r5, r6, r7, r15

; Hour 5
LDI r4, 170
LDI r5, 202
LDI r6, 176
LDI r7, 210
LINE r4, r5, r6, r7, r15

; Hour 6
LDI r4, 128
LDI r5, 213
LDI r6, 128
LDI r7, 223
LINE r4, r5, r6, r7, r15

; Hour 7
LDI r4, 86
LDI r5, 202
LDI r6, 81
LDI r7, 210
LINE r4, r5, r6, r7, r15

; Hour 8
LDI r4, 54
LDI r5, 170
LDI r6, 46
LDI r7, 176
LINE r4, r5, r6, r7, r15

; Hour 9
LDI r4, 43
LDI r5, 128
LDI r6, 33
LDI r7, 128
LINE r4, r5, r6, r7, r15

; Hour 10
LDI r4, 54
LDI r5, 86
LDI r6, 46
LDI r7, 81
LINE r4, r5, r6, r7, r15

; Hour 11
LDI r4, 86
LDI r5, 54
LDI r6, 81
LDI r7, 46
LINE r4, r5, r6, r7, r15

; Hour hand (3 o'clock, pointing right) - thick red line
LDI r15, 0xFF0000
LDI r4, 128
LDI r5, 128
LDI r6, 188
LDI r7, 128
LINE r4, r5, r6, r7, r15
; Slight offset for thickness
LDI r5, 127
LINE r4, r5, r6, r5, r15
LDI r5, 129
LINE r4, r5, r6, r5, r15

; Minute hand (12 o'clock, pointing up) - thick blue line
LDI r15, 0x0044FF
LDI r4, 128
LDI r5, 128
LDI r6, 128
LDI r7, 48
LINE r4, r5, r6, r7, r15
; Slight offset for thickness
LDI r4, 127
LINE r4, r5, r4, r7, r15
LDI r4, 129
LINE r4, r5, r4, r7, r15

; Center dot
LDI r0, 128
LDI r1, 128
LDI r15, 0xFF4444
PSET r0, r1, r15
PSET r0, r1, r15

HALT
