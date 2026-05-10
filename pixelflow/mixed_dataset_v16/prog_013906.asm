; DESCRIPTION: Creates a orange rectangular region at (43, 67) spanning 68 by 109 pixels.
; PLAN: r0=43(x), r1=67(y), r2=68(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 67
LDI r2, 68
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
