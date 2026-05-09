; DESCRIPTION: Composite: Creates a orange rectangular region at (209, 10) spanning 101 by 96 pixels then Sets a single black pixel at (16, 240) then Renders a red line between points (247, 72) and (54, 181).
; PLAN: r0=209(x), r1=10(y), r2=101(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=240(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=247(x1), r11=72(y1), r12=54(x2), r13=181(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 10
LDI r2, 101
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 240
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 247
LDI r11, 72
LDI r12, 54
LDI r13, 181
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
