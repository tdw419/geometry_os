; DESCRIPTION: Creates a orange rectangular region at (53, 67) spanning 84 by 59 pixels.
; PLAN: r0=53(x), r1=67(y), r2=84(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 67
LDI r2, 84
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
