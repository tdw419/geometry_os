; DESCRIPTION: Creates a black rectangular region at (257, 183) spanning 102 by 40 pixels.
; PLAN: r0=257(x), r1=183(y), r2=102(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 183
LDI r2, 102
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
