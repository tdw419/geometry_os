; DESCRIPTION: Creates a red rectangular region at (257, 88) spanning 14 by 108 pixels.
; PLAN: r0=257(x), r1=88(y), r2=14(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 88
LDI r2, 14
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
