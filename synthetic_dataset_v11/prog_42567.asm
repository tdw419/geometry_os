; DESCRIPTION: Renders a purple box of size 12x51 starting at (184, 187).
; PLAN: r0=184(x), r1=187(y), r2=12(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 187
LDI r2, 12
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
