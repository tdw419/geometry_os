; DESCRIPTION: Creates a red rectangular region at (257, 45) spanning 96 by 76 pixels.
; PLAN: r0=257(x), r1=45(y), r2=96(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 45
LDI r2, 96
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
