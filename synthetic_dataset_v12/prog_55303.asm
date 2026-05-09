; DESCRIPTION: Creates a orange rectangular region at (209, 63) spanning 67 by 101 pixels.
; PLAN: r0=209(x), r1=63(y), r2=67(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 63
LDI r2, 67
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
