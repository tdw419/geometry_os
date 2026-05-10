; DESCRIPTION: Composite: Renders a magenta disk with center (236, 87) and radius 72 then Sets a single orange pixel at (316, 38) then Draws a red rectangle at (142, 154) with width 77 and height 79.
; PLAN: r0=236(x), r1=87(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=38(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=142(x), r11=154(y), r12=77(width), r13=79(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 87
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 38
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 142
LDI r11, 154
LDI r12, 77
LDI r13, 79
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
