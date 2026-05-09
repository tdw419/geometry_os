; DESCRIPTION: Renders a purple box of size 91x120 starting at (63, 119).
; PLAN: r0=63(x), r1=119(y), r2=91(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 119
LDI r2, 91
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
