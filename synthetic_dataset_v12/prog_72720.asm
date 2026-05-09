; DESCRIPTION: Composite: Renders a blue line between points (101, 253) and (489, 229) then Places a cyan dot at position (166, 25) then Creates a magenta rectangular region at (51, 73) spanning 69 by 108 pixels.
; PLAN: r0=101(x1), r1=253(y1), r2=489(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=25(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=51(x), r11=73(y), r12=69(width), r13=108(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 253
LDI r2, 489
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 25
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 73
LDI r12, 69
LDI r13, 108
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
