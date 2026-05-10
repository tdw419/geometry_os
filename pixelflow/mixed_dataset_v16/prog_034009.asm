; DESCRIPTION: Composite: Draws a red line from (395, 168) to (297, 35) then Renders a black disk with center (406, 142) and radius 69.
; PLAN: r0=395(x1), r1=168(y1), r2=297(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=142(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 395
LDI r1, 168
LDI r2, 297
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 142
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
