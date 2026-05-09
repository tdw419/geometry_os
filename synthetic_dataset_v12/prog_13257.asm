; DESCRIPTION: Renders a purple box of size 120x68 starting at (95, 119).
; PLAN: r0=95(x), r1=119(y), r2=120(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 119
LDI r2, 120
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
