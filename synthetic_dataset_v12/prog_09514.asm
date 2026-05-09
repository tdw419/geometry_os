; DESCRIPTION: Creates a orange rectangular region at (231, 78) spanning 15 by 29 pixels.
; PLAN: r0=231(x), r1=78(y), r2=15(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 78
LDI r2, 15
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
