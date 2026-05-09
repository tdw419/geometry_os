; DESCRIPTION: Creates a red rectangular region at (257, 92) spanning 64 by 91 pixels.
; PLAN: r0=257(x), r1=92(y), r2=64(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 92
LDI r2, 64
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
