; DESCRIPTION: Renders a orange box of size 62x67 starting at (367, 75).
; PLAN: r0=367(x), r1=75(y), r2=62(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 75
LDI r2, 62
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
