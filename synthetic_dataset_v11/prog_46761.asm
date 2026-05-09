; DESCRIPTION: Renders a yellow box of size 97x44 starting at (44, 85).
; PLAN: r0=44(x), r1=85(y), r2=97(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 85
LDI r2, 97
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
