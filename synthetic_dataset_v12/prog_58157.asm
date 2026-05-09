; DESCRIPTION: Composite: Renders a purple disk with center (96, 123) and radius 73 then Draws a blue line from (181, 38) to (404, 104).
; PLAN: r0=96(x), r1=123(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=38(y1), r7=404(x2), r8=104(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 123
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 38
LDI r7, 404
LDI r8, 104
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
