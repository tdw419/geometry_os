; DESCRIPTION: Composite: Renders a yellow disk with center (162, 115) and radius 74 then Sets a single red pixel at (279, 171) then Creates a magenta rectangular region at (338, 73) spanning 116 by 53 pixels.
; PLAN: r0=162(x), r1=115(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=171(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=73(y), r12=116(width), r13=53(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 115
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 171
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 338
LDI r11, 73
LDI r12, 116
LDI r13, 53
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
