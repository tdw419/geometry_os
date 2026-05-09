; DESCRIPTION: Creates a orange rectangular region at (194, 18) spanning 15 by 117 pixels.
; PLAN: r0=194(x), r1=18(y), r2=15(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 18
LDI r2, 15
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
