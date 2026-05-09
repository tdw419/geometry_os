; DESCRIPTION: Composite: Renders a green disk with center (365, 144) and radius 61 then Draws a orange line from (455, 171) to (235, 115) then Places a red 43x73 rectangle at position (246, 92).
; PLAN: r0=365(x), r1=144(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=171(y1), r7=235(x2), r8=115(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=246(x), r11=92(y), r12=43(width), r13=73(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 144
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 171
LDI r7, 235
LDI r8, 115
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 92
LDI r12, 43
LDI r13, 73
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
