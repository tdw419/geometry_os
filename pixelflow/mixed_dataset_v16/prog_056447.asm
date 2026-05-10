; DESCRIPTION: Composite: Creates a purple rectangular region at (330, 6) spanning 11 by 100 pixels then Creates a red circular shape at (325, 71) with radius 63 then Sets a single magenta pixel at (46, 25).
; PLAN: r0=330(x), r1=6(y), r2=11(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=71(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=46(x), r11=25(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 6
LDI r2, 11
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 71
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 46
LDI r11, 25
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
