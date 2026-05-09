; DESCRIPTION: Renders a purple box of size 76x106 starting at (0, 103).
; PLAN: r0=0(x), r1=103(y), r2=76(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 103
LDI r2, 76
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
