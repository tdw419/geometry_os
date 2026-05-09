; DESCRIPTION: Composite: Creates a blue rectangular region at (293, 198) spanning 100 by 38 pixels then Sets a single magenta pixel at (48, 254).
; PLAN: r0=293(x), r1=198(y), r2=100(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=254(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 198
LDI r2, 100
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 254
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
