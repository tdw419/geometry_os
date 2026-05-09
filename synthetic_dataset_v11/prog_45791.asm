; DESCRIPTION: Renders a purple box of size 101x52 starting at (8, 86).
; PLAN: r0=8(x), r1=86(y), r2=101(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 86
LDI r2, 101
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
