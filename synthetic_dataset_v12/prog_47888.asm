; DESCRIPTION: Renders a orange box of size 67x71 starting at (89, 133).
; PLAN: r0=89(x), r1=133(y), r2=67(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 133
LDI r2, 67
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
