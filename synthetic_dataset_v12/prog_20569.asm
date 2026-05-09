; DESCRIPTION: Creates a orange rectangular region at (203, 139) spanning 48 by 24 pixels.
; PLAN: r0=203(x), r1=139(y), r2=48(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 139
LDI r2, 48
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
