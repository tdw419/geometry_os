; DESCRIPTION: Composite: Renders a white line between points (128, 218) and (301, 225) then Draws a green circle centered at (166, 84) with radius 66.
; PLAN: r0=128(x1), r1=218(y1), r2=301(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=84(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 128
LDI r1, 218
LDI r2, 301
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 84
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
