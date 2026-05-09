; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (142, 160) with radius 66. Then Draws a purple line from (23, 140) to (59, 84).
; PLAN: r0=142(x), r1=160(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x1), r1=140(y1), r2=59(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (142, 160) with radius 66.
; PLAN: r0=142(x), r1=160(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 160
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (23, 140) to (59, 84).
; PLAN: r0=23(x1), r1=140(y1), r2=59(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 140
LDI r2, 59
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
