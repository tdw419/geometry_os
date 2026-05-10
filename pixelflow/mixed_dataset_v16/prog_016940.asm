; DESCRIPTION: Composite: Creates a black rectangular region at (59, 8) spanning 69 by 45 pixels then Places a magenta dot at position (65, 57) then Renders a blue line between points (391, 163) and (318, 246).
; PLAN: r0=59(x), r1=8(y), r2=69(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=57(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=391(x1), r11=163(y1), r12=318(x2), r13=246(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 8
LDI r2, 69
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 57
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 391
LDI r11, 163
LDI r12, 318
LDI r13, 246
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
