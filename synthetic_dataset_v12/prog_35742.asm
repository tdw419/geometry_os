; DESCRIPTION: Renders a blue box of size 59x110 starting at (309, 41).
; PLAN: r0=309(x), r1=41(y), r2=59(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 41
LDI r2, 59
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
