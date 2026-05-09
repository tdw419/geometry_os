; DESCRIPTION: Composite: Creates a red rectangular region at (203, 104) spanning 76 by 114 pixels then Sets a single magenta pixel at (112, 108).
; PLAN: r0=203(x), r1=104(y), r2=76(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=108(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 104
LDI r2, 76
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 108
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
