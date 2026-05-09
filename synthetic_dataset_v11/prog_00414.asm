; DESCRIPTION: Creates a orange rectangular region at (47, 64) spanning 66 by 88 pixels.
; PLAN: r0=47(x), r1=64(y), r2=66(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 64
LDI r2, 66
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
