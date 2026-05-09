; DESCRIPTION: Renders a purple box of size 93x90 starting at (191, 93).
; PLAN: r0=191(x), r1=93(y), r2=93(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 93
LDI r2, 93
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
