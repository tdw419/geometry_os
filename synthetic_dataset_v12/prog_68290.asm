; DESCRIPTION: Creates a orange rectangular region at (172, 106) spanning 71 by 88 pixels.
; PLAN: r0=172(x), r1=106(y), r2=71(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 106
LDI r2, 71
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
