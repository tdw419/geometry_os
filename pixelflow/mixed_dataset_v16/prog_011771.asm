; DESCRIPTION: Composite: Creates a orange rectangular region at (293, 70) spanning 43 by 52 pixels then Sets a single red pixel at (414, 24).
; PLAN: r0=293(x), r1=70(y), r2=43(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=24(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 70
LDI r2, 43
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 24
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
