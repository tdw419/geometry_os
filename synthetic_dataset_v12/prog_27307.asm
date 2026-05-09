; DESCRIPTION: Renders a orange box of size 41x92 starting at (84, 2).
; PLAN: r0=84(x), r1=2(y), r2=41(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 2
LDI r2, 41
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
