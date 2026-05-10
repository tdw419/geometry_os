; DESCRIPTION: Composite: Draws a red line from (73, 220) to (5, 45) then Places a blue circle of radius 76 at center (297, 165).
; PLAN: r0=73(x1), r1=220(y1), r2=5(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=165(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 73
LDI r1, 220
LDI r2, 5
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 165
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
