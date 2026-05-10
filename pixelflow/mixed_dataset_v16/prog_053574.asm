; DESCRIPTION: Composite: Creates a yellow rectangular region at (92, 167) spanning 40 by 69 pixels then Places a yellow dot at position (469, 99) then Renders a orange line between points (51, 93) and (180, 225).
; PLAN: r0=92(x), r1=167(y), r2=40(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x), r6=99(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=51(x1), r11=93(y1), r12=180(x2), r13=225(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 167
LDI r2, 40
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 99
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 51
LDI r11, 93
LDI r12, 180
LDI r13, 225
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
