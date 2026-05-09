; DESCRIPTION: Composite: Creates a black rectangular region at (69, 220) spanning 102 by 27 pixels then Sets a single red pixel at (10, 19) then Renders a green disk with center (408, 215) and radius 25.
; PLAN: r0=69(x), r1=220(y), r2=102(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=19(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=408(x), r11=215(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 220
LDI r2, 102
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 19
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 408
LDI r11, 215
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
