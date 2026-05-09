; DESCRIPTION: Creates a orange rectangular region at (55, 92) spanning 66 by 28 pixels.
; PLAN: r0=55(x), r1=92(y), r2=66(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 92
LDI r2, 66
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
