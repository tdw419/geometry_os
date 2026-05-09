; DESCRIPTION: Creates a orange rectangular region at (354, 6) spanning 67 by 97 pixels.
; PLAN: r0=354(x), r1=6(y), r2=67(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 6
LDI r2, 67
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
