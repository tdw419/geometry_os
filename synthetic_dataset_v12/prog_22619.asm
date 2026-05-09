; DESCRIPTION: Creates a yellow rectangular region at (257, 191) spanning 107 by 58 pixels.
; PLAN: r0=257(x), r1=191(y), r2=107(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 191
LDI r2, 107
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
