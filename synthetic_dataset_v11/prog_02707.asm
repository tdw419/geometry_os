; DESCRIPTION: Renders a purple box of size 52x28 starting at (90, 45).
; PLAN: r0=90(x), r1=45(y), r2=52(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 45
LDI r2, 52
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
