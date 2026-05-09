; DESCRIPTION: Renders a purple box of size 46x75 starting at (317, 62).
; PLAN: r0=317(x), r1=62(y), r2=46(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 62
LDI r2, 46
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
