; DESCRIPTION: Renders a purple box of size 96x34 starting at (86, 137).
; PLAN: r0=86(x), r1=137(y), r2=96(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 137
LDI r2, 96
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
