; DESCRIPTION: Creates a orange rectangular region at (74, 3) spanning 53 by 119 pixels.
; PLAN: r0=74(x), r1=3(y), r2=53(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 3
LDI r2, 53
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
