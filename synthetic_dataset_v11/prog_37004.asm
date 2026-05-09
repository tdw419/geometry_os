; DESCRIPTION: Renders a yellow box of size 44x94 starting at (112, 110).
; PLAN: r0=112(x), r1=110(y), r2=44(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 110
LDI r2, 44
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
