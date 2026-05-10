; DESCRIPTION: Renders a orange box of size 111x41 starting at (125, 97).
; PLAN: r0=125(x), r1=97(y), r2=111(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 97
LDI r2, 111
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
