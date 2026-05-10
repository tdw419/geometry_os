; DESCRIPTION: Composite: Places a magenta circle of radius 11 at center (267, 238) then Creates a black rectangular region at (283, 167) spanning 115 by 16 pixels then Draws a blue line from (497, 60) to (426, 190).
; PLAN: r0=267(x), r1=238(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=167(y), r7=115(width), r8=16(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=60(y1), r12=426(x2), r13=190(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 238
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 167
LDI r7, 115
LDI r8, 16
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 60
LDI r12, 426
LDI r13, 190
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
