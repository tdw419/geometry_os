; DESCRIPTION: Renders a purple box of size 25x28 starting at (126, 62).
; PLAN: r0=126(x), r1=62(y), r2=25(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 62
LDI r2, 25
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
