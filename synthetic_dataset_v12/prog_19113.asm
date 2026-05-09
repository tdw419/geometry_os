; DESCRIPTION: Composite: Creates a orange circular shape at (113, 143) with radius 24 then Renders a black line between points (478, 206) and (153, 238).
; PLAN: r0=113(x), r1=143(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=206(y1), r7=153(x2), r8=238(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 143
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 206
LDI r7, 153
LDI r8, 238
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
