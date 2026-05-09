; DESCRIPTION: Renders a purple box of size 70x43 starting at (56, 31).
; PLAN: r0=56(x), r1=31(y), r2=70(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 31
LDI r2, 70
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
