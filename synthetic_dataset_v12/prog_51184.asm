; DESCRIPTION: Composite: Creates a black rectangular region at (253, 109) spanning 11 by 112 pixels then Sets a single cyan pixel at (219, 203).
; PLAN: r0=253(x), r1=109(y), r2=11(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=203(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 109
LDI r2, 11
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 203
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
