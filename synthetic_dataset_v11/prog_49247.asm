; DESCRIPTION: Renders a purple box of size 91x41 starting at (159, 125).
; PLAN: r0=159(x), r1=125(y), r2=91(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 125
LDI r2, 91
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
