; DESCRIPTION: Composite: Renders a white line between points (142, 18) and (494, 208) then Places a red circle of radius 41 at center (339, 195) then Places a magenta dot at position (87, 24).
; PLAN: r0=142(x1), r1=18(y1), r2=494(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=195(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=87(x), r11=24(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 18
LDI r2, 494
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 195
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 87
LDI r11, 24
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
