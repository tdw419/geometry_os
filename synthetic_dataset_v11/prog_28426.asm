; DESCRIPTION: Renders a purple box of size 13x52 starting at (210, 22).
; PLAN: r0=210(x), r1=22(y), r2=13(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 22
LDI r2, 13
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
