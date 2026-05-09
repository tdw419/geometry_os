; DESCRIPTION: Renders a purple box of size 82x67 starting at (8, 147).
; PLAN: r0=8(x), r1=147(y), r2=82(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 147
LDI r2, 82
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
