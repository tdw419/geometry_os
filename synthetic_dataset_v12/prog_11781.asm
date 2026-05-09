; DESCRIPTION: Renders a orange box of size 67x63 starting at (381, 130).
; PLAN: r0=381(x), r1=130(y), r2=67(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 130
LDI r2, 67
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
