; DESCRIPTION: Composite: Draws a white circle centered at (442, 140) with radius 59 then Places a black dot at position (257, 115) then Renders a magenta line between points (44, 117) and (7, 118).
; PLAN: r0=442(x), r1=140(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=115(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=44(x1), r11=117(y1), r12=7(x2), r13=118(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 140
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 115
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 44
LDI r11, 117
LDI r12, 7
LDI r13, 118
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
