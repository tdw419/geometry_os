; DESCRIPTION: Renders a purple box of size 70x93 starting at (233, 40).
; PLAN: r0=233(x), r1=40(y), r2=70(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 40
LDI r2, 70
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
