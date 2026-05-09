; DESCRIPTION: Renders a purple box of size 108x11 starting at (52, 93).
; PLAN: r0=52(x), r1=93(y), r2=108(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 93
LDI r2, 108
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
