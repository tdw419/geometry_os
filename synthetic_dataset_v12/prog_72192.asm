; DESCRIPTION: Creates a orange rectangular region at (461, 60) spanning 22 by 68 pixels.
; PLAN: r0=461(x), r1=60(y), r2=22(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 60
LDI r2, 22
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
