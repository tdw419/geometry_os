; DESCRIPTION: Renders a orange box of size 111x43 starting at (132, 52).
; PLAN: r0=132(x), r1=52(y), r2=111(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 52
LDI r2, 111
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
