; DESCRIPTION: Creates a orange rectangular region at (49, 203) spanning 81 by 24 pixels.
; PLAN: r0=49(x), r1=203(y), r2=81(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 203
LDI r2, 81
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
