; DESCRIPTION: Creates a orange rectangular region at (47, 117) spanning 88 by 91 pixels.
; PLAN: r0=47(x), r1=117(y), r2=88(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 117
LDI r2, 88
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
