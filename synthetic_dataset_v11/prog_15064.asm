; DESCRIPTION: Renders a purple box of size 93x90 starting at (52, 76).
; PLAN: r0=52(x), r1=76(y), r2=93(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 76
LDI r2, 93
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
