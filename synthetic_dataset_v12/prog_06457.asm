; DESCRIPTION: Renders a purple box of size 24x107 starting at (148, 35).
; PLAN: r0=148(x), r1=35(y), r2=24(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 35
LDI r2, 24
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
