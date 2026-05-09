; DESCRIPTION: Renders a purple box of size 54x63 starting at (191, 41).
; PLAN: r0=191(x), r1=41(y), r2=54(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 41
LDI r2, 54
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
