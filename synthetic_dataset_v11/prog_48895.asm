; DESCRIPTION: Renders a orange box of size 65x41 starting at (106, 5).
; PLAN: r0=106(x), r1=5(y), r2=65(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 5
LDI r2, 65
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
