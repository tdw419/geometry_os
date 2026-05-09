; DESCRIPTION: Renders a purple box of size 41x113 starting at (162, 31).
; PLAN: r0=162(x), r1=31(y), r2=41(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 31
LDI r2, 41
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
