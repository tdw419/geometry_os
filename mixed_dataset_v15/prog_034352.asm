; DESCRIPTION: Composite: Draws a orange circle centered at (112, 65) with radius 62 then Renders a cyan line between points (31, 141) and (510, 88).
; PLAN: r0=112(x), r1=65(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x1), r6=141(y1), r7=510(x2), r8=88(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 65
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 141
LDI r7, 510
LDI r8, 88
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
