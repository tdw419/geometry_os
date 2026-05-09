; DESCRIPTION: Composite: Renders a purple box of size 73x101 starting at (251, 138) then Renders a orange line between points (219, 14) and (288, 56).
; PLAN: r0=251(x), r1=138(y), r2=73(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x1), r6=14(y1), r7=288(x2), r8=56(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 138
LDI r2, 73
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 14
LDI r7, 288
LDI r8, 56
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
