; DESCRIPTION: Composite: Places a orange dot at position (98, 178) then Draws a blue circle centered at (208, 42) with radius 15 then Renders a purple line between points (47, 138) and (101, 241).
; PLAN: r0=98(x), r1=178(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=42(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x1), r11=138(y1), r12=101(x2), r13=241(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 178
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 208
LDI r6, 42
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 138
LDI r12, 101
LDI r13, 241
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
