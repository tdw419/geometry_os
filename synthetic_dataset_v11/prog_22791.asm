; DESCRIPTION: Renders a blue box of size 82x107 starting at (8, 87).
; PLAN: r0=8(x), r1=87(y), r2=82(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 87
LDI r2, 82
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
