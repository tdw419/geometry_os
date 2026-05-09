; DESCRIPTION: Renders a purple box of size 52x112 starting at (197, 63).
; PLAN: r0=197(x), r1=63(y), r2=52(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 63
LDI r2, 52
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
