; DESCRIPTION: Creates a orange rectangular region at (47, 18) spanning 76 by 74 pixels.
; PLAN: r0=47(x), r1=18(y), r2=76(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 18
LDI r2, 76
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
