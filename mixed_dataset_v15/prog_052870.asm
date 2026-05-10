; DESCRIPTION: Composite: Renders a blue disk with center (189, 157) and radius 25 then Places a cyan line segment connecting (507, 134) to (471, 169) then Places a cyan dot at position (82, 102).
; PLAN: r0=189(x), r1=157(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x1), r6=134(y1), r7=471(x2), r8=169(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=102(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 189
LDI r1, 157
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 134
LDI r7, 471
LDI r8, 169
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 102
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
