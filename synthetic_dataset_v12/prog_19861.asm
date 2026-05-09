; DESCRIPTION: Renders a purple box of size 84x28 starting at (52, 30).
; PLAN: r0=52(x), r1=30(y), r2=84(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 30
LDI r2, 84
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
