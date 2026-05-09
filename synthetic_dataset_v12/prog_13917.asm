; DESCRIPTION: Composite: Renders a red line between points (288, 35) and (104, 28) then Renders a purple disk with center (421, 155) and radius 71 then Places a white dot at position (187, 127).
; PLAN: r0=288(x1), r1=35(y1), r2=104(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=155(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=127(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 35
LDI r2, 104
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 155
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 127
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
