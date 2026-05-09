; DESCRIPTION: Renders a purple box of size 30x90 starting at (25, 140).
; PLAN: r0=25(x), r1=140(y), r2=30(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 140
LDI r2, 30
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
