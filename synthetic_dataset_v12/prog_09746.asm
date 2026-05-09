; DESCRIPTION: Composite: Renders a blue disk with center (81, 101) and radius 61 then Draws a black line from (254, 87) to (184, 172).
; PLAN: r0=81(x), r1=101(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x1), r6=87(y1), r7=184(x2), r8=172(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 101
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 87
LDI r7, 184
LDI r8, 172
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
