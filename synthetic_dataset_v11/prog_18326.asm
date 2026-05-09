; DESCRIPTION: Renders a orange box of size 41x71 starting at (86, 7).
; PLAN: r0=86(x), r1=7(y), r2=41(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 7
LDI r2, 41
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
