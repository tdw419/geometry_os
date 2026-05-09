; DESCRIPTION: Composite: Creates a purple circular shape at (349, 164) with radius 43 then Draws a red line from (282, 233) to (368, 225).
; PLAN: r0=349(x), r1=164(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x1), r6=233(y1), r7=368(x2), r8=225(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 164
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 233
LDI r7, 368
LDI r8, 225
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
