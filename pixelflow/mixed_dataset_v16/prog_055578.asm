; DESCRIPTION: Composite: Draws a white line from (315, 246) to (95, 30) then Places a white circle of radius 47 at center (254, 82).
; PLAN: r0=315(x1), r1=246(y1), r2=95(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=82(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 246
LDI r2, 95
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 82
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
