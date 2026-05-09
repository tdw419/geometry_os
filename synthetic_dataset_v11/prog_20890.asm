; DESCRIPTION: Renders a purple box of size 60x108 starting at (170, 42).
; PLAN: r0=170(x), r1=42(y), r2=60(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 42
LDI r2, 60
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
