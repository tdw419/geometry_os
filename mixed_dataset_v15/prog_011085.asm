; DESCRIPTION: Composite: Draws a blue line from (418, 190) to (303, 155) then Places a magenta circle of radius 26 at center (119, 178).
; PLAN: r0=418(x1), r1=190(y1), r2=303(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=178(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 190
LDI r2, 303
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 178
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
