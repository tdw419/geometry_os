; DESCRIPTION: Composite: Creates a black rectangular region at (418, 209) spanning 86 by 17 pixels then Sets a single magenta pixel at (1, 73) then Draws a red line from (397, 3) to (114, 52).
; PLAN: r0=418(x), r1=209(y), r2=86(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=73(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=397(x1), r11=3(y1), r12=114(x2), r13=52(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 209
LDI r2, 86
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 73
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 397
LDI r11, 3
LDI r12, 114
LDI r13, 52
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
