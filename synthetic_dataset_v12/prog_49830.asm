; DESCRIPTION: Creates a orange rectangular region at (317, 62) spanning 15 by 67 pixels.
; PLAN: r0=317(x), r1=62(y), r2=15(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 62
LDI r2, 15
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
