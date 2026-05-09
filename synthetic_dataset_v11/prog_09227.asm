; DESCRIPTION: Renders a purple box of size 57x54 starting at (158, 70).
; PLAN: r0=158(x), r1=70(y), r2=57(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 70
LDI r2, 57
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
