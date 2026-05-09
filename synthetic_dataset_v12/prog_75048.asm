; DESCRIPTION: Renders a purple box of size 93x18 starting at (220, 85).
; PLAN: r0=220(x), r1=85(y), r2=93(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 85
LDI r2, 93
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
