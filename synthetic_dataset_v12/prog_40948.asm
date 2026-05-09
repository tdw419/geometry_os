; DESCRIPTION: Composite: Creates a yellow rectangular region at (408, 93) spanning 60 by 25 pixels then Sets a single orange pixel at (213, 157) then Draws a blue line from (319, 153) to (207, 53).
; PLAN: r0=408(x), r1=93(y), r2=60(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=157(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=319(x1), r11=153(y1), r12=207(x2), r13=53(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 93
LDI r2, 60
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 157
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 319
LDI r11, 153
LDI r12, 207
LDI r13, 53
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
