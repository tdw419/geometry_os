; DESCRIPTION: Renders a purple box of size 90x41 starting at (282, 142).
; PLAN: r0=282(x), r1=142(y), r2=90(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 142
LDI r2, 90
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
