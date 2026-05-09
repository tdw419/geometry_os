; DESCRIPTION: Creates a orange rectangular region at (122, 141) spanning 21 by 34 pixels.
; PLAN: r0=122(x), r1=141(y), r2=21(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 141
LDI r2, 21
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
