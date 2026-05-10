; DESCRIPTION: Composite: Places a black line segment connecting (483, 3) to (409, 3) then Renders a yellow box of size 105x48 starting at (196, 112).
; PLAN: r0=483(x1), r1=3(y1), r2=409(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=112(y), r7=105(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 3
LDI r2, 409
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 112
LDI r7, 105
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
