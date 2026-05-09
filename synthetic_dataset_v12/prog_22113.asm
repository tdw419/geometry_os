; DESCRIPTION: Creates a orange rectangular region at (268, 118) spanning 34 by 53 pixels.
; PLAN: r0=268(x), r1=118(y), r2=34(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 118
LDI r2, 34
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
