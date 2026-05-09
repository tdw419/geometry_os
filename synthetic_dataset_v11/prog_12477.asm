; DESCRIPTION: Creates a orange rectangular region at (37, 15) spanning 62 by 116 pixels.
; PLAN: r0=37(x), r1=15(y), r2=62(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 15
LDI r2, 62
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
