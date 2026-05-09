; DESCRIPTION: Composite: Places a blue circle of radius 29 at center (240, 113) then Renders a purple line between points (53, 159) and (185, 41) then Places a magenta dot at position (178, 39).
; PLAN: r0=240(x), r1=113(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x1), r6=159(y1), r7=185(x2), r8=41(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=39(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 113
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 159
LDI r7, 185
LDI r8, 41
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 39
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
