; DESCRIPTION: Renders a purple box of size 50x41 starting at (300, 145).
; PLAN: r0=300(x), r1=145(y), r2=50(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 145
LDI r2, 50
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
