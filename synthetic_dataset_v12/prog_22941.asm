; DESCRIPTION: Composite: Draws a magenta line from (200, 165) to (185, 28) then Sets a single green pixel at (306, 177) then Places a red 116x91 rectangle at position (29, 93).
; PLAN: r0=200(x1), r1=165(y1), r2=185(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=177(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=29(x), r11=93(y), r12=116(width), r13=91(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 165
LDI r2, 185
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 177
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 29
LDI r11, 93
LDI r12, 116
LDI r13, 91
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
