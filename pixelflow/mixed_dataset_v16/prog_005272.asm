; DESCRIPTION: Composite: Renders a white box of size 93x34 starting at (322, 134) then Renders a blue line between points (441, 226) and (118, 225) then Places a black dot at position (146, 101).
; PLAN: r0=322(x), r1=134(y), r2=93(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x1), r6=226(y1), r7=118(x2), r8=225(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=101(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 322
LDI r1, 134
LDI r2, 93
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 226
LDI r7, 118
LDI r8, 225
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 101
LDI r12, 0x000000
PSET r10, r11, r12
HALT
