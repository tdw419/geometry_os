; DESCRIPTION: Renders a orange box of size 89x67 starting at (390, 79).
; PLAN: r0=390(x), r1=79(y), r2=89(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 79
LDI r2, 89
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
