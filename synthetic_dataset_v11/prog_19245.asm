; DESCRIPTION: Renders a purple box of size 24x60 starting at (220, 87).
; PLAN: r0=220(x), r1=87(y), r2=24(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 87
LDI r2, 24
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
