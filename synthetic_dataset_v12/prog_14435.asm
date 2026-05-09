; DESCRIPTION: Composite: Renders a cyan line between points (288, 252) and (45, 229) then Creates a magenta circular shape at (413, 155) with radius 35.
; PLAN: r0=288(x1), r1=252(y1), r2=45(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=155(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 252
LDI r2, 45
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 155
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
