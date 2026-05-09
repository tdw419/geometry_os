; DESCRIPTION: Composite: Places a orange circle of radius 15 at center (477, 125) then Places a white dot at position (42, 49) then Renders a yellow line between points (491, 107) and (91, 27).
; PLAN: r0=477(x), r1=125(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=49(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=491(x1), r11=107(y1), r12=91(x2), r13=27(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 125
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 49
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 491
LDI r11, 107
LDI r12, 91
LDI r13, 27
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
