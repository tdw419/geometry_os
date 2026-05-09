; DESCRIPTION: Renders a orange box of size 67x41 starting at (331, 211).
; PLAN: r0=331(x), r1=211(y), r2=67(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 211
LDI r2, 67
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
