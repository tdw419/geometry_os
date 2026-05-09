; DESCRIPTION: Composite: Draws a black line from (208, 40) to (355, 185) then Renders a red disk with center (126, 50) and radius 49.
; PLAN: r0=208(x1), r1=40(y1), r2=355(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=50(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 208
LDI r1, 40
LDI r2, 355
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 50
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
