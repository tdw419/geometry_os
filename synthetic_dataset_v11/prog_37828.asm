; DESCRIPTION: Creates a orange rectangular region at (15, 71) spanning 112 by 99 pixels.
; PLAN: r0=15(x), r1=71(y), r2=112(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 71
LDI r2, 112
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
