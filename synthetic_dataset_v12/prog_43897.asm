; DESCRIPTION: Creates a orange rectangular region at (112, 67) spanning 43 by 21 pixels.
; PLAN: r0=112(x), r1=67(y), r2=43(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 67
LDI r2, 43
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
