; DESCRIPTION: Composite: Sets a single white pixel at (418, 84) then Renders a cyan line between points (34, 188) and (338, 115) then Places a purple circle of radius 64 at center (134, 184).
; PLAN: r0=418(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=34(x1), r6=188(y1), r7=338(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=184(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 84
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 34
LDI r6, 188
LDI r7, 338
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 184
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
