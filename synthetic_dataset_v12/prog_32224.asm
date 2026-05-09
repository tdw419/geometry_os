; DESCRIPTION: Composite: Creates a magenta rectangular region at (387, 185) spanning 119 by 53 pixels then Sets a single black pixel at (487, 88) then Renders a magenta disk with center (343, 140) and radius 31.
; PLAN: r0=387(x), r1=185(y), r2=119(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=88(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=343(x), r11=140(y), r12=31(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 185
LDI r2, 119
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 88
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 343
LDI r11, 140
LDI r12, 31
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
