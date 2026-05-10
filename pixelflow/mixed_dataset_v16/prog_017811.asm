; DESCRIPTION: Renders a purple box of size 68x52 starting at (89, 68).
; PLAN: r0=89(x), r1=68(y), r2=68(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 68
LDI r2, 68
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
