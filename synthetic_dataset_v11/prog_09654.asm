; DESCRIPTION: Creates a orange rectangular region at (26, 70) spanning 96 by 101 pixels.
; PLAN: r0=26(x), r1=70(y), r2=96(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 70
LDI r2, 96
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
