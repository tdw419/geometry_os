; DESCRIPTION: Composite: Creates a black rectangular region at (151, 142) spanning 27 by 28 pixels then Sets a single cyan pixel at (362, 142) then Draws a blue circle centered at (292, 138) with radius 56.
; PLAN: r0=151(x), r1=142(y), r2=27(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=142(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=138(y), r12=56(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 142
LDI r2, 27
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 142
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 292
LDI r11, 138
LDI r12, 56
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
