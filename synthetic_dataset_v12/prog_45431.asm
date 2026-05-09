; DESCRIPTION: Creates a orange rectangular region at (297, 92) spanning 76 by 49 pixels.
; PLAN: r0=297(x), r1=92(y), r2=76(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 92
LDI r2, 76
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
