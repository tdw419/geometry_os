; DESCRIPTION: Composite: Draws a yellow circle centered at (406, 194) with radius 14 then Renders a purple line between points (482, 121) and (110, 73).
; PLAN: r0=406(x), r1=194(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x1), r6=121(y1), r7=110(x2), r8=73(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 194
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 121
LDI r7, 110
LDI r8, 73
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
