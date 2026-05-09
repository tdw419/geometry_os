; DESCRIPTION: Composite: Draws a red line from (200, 197) to (31, 188) then Places a white circle of radius 66 at center (190, 95).
; PLAN: r0=200(x1), r1=197(y1), r2=31(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=95(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 200
LDI r1, 197
LDI r2, 31
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 95
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
