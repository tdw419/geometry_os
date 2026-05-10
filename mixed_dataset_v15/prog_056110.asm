; DESCRIPTION: Composite: Draws a green circle centered at (373, 64) with radius 57 then Renders a orange line between points (227, 27) and (277, 206).
; PLAN: r0=373(x), r1=64(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=27(y1), r7=277(x2), r8=206(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 64
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 27
LDI r7, 277
LDI r8, 206
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
