; DESCRIPTION: Composite: Draws a yellow circle centered at (199, 80) with radius 49 then Renders a black line between points (13, 68) and (320, 27).
; PLAN: r0=199(x), r1=80(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x1), r6=68(y1), r7=320(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 80
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 68
LDI r7, 320
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
