; DESCRIPTION: Composite: Renders a green line between points (346, 54) and (147, 186) then Draws a cyan circle centered at (334, 157) with radius 62.
; PLAN: r0=346(x1), r1=54(y1), r2=147(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=157(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 54
LDI r2, 147
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 157
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
