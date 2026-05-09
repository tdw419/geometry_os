; DESCRIPTION: Creates a orange rectangular region at (40, 84) spanning 67 by 96 pixels.
; PLAN: r0=40(x), r1=84(y), r2=67(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 84
LDI r2, 67
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
