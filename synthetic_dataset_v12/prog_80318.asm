; DESCRIPTION: Renders a purple box of size 20x112 starting at (361, 134).
; PLAN: r0=361(x), r1=134(y), r2=20(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 134
LDI r2, 20
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
