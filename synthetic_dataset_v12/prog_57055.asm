; DESCRIPTION: Creates a orange rectangular region at (101, 3) spanning 68 by 49 pixels.
; PLAN: r0=101(x), r1=3(y), r2=68(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 3
LDI r2, 68
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
