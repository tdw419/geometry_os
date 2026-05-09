; DESCRIPTION: Places a yellow 19x94 rectangle at position (185, 77).
; PLAN: r0=185(x), r1=77(y), r2=19(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 77
LDI r2, 19
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
