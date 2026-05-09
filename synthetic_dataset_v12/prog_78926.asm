; DESCRIPTION: Composite: Renders a orange line between points (437, 145) and (329, 225) then Renders a magenta box of size 52x19 starting at (137, 51).
; PLAN: r0=437(x1), r1=145(y1), r2=329(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=51(y), r7=52(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 145
LDI r2, 329
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 51
LDI r7, 52
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
