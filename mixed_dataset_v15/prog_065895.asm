; DESCRIPTION: Composite: Renders a magenta line between points (64, 165) and (247, 126) then Creates a blue circular shape at (162, 84) with radius 52.
; PLAN: r0=64(x1), r1=165(y1), r2=247(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=84(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 165
LDI r2, 247
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 84
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
