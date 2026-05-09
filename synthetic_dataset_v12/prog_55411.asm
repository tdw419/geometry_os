; DESCRIPTION: Composite: Renders a green line between points (209, 94) and (223, 212) then Draws a red circle centered at (417, 88) with radius 49.
; PLAN: r0=209(x1), r1=94(y1), r2=223(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=88(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 94
LDI r2, 223
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 88
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
