; DESCRIPTION: Composite: Renders a orange box of size 118x60 starting at (147, 182) then Places a white dot at position (189, 210) then Renders a red line between points (456, 59) and (289, 229).
; PLAN: r0=147(x), r1=182(y), r2=118(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=210(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=456(x1), r11=59(y1), r12=289(x2), r13=229(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 182
LDI r2, 118
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 210
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 456
LDI r11, 59
LDI r12, 289
LDI r13, 229
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
