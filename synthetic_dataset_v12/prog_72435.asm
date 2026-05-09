; DESCRIPTION: Creates a red rectangular region at (15, 92) spanning 32 by 11 pixels.
; PLAN: r0=15(x), r1=92(y), r2=32(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 92
LDI r2, 32
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
