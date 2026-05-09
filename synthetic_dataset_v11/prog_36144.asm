; DESCRIPTION: Renders a purple box of size 107x120 starting at (102, 136).
; PLAN: r0=102(x), r1=136(y), r2=107(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 136
LDI r2, 107
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
