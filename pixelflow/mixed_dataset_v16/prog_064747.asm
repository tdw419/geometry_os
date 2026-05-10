; DESCRIPTION: Renders a purple box of size 36x26 starting at (55, 0).
; PLAN: r0=55(x), r1=0(y), r2=36(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 0
LDI r2, 36
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
