; DESCRIPTION: Creates a orange rectangular region at (122, 1) spanning 18 by 117 pixels.
; PLAN: r0=122(x), r1=1(y), r2=18(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 1
LDI r2, 18
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
