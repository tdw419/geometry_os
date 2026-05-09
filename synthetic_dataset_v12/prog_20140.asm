; DESCRIPTION: Renders a orange box of size 67x109 starting at (66, 34).
; PLAN: r0=66(x), r1=34(y), r2=67(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 34
LDI r2, 67
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
