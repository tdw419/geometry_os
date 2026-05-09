; DESCRIPTION: Renders a purple box of size 70x63 starting at (322, 68).
; PLAN: r0=322(x), r1=68(y), r2=70(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 68
LDI r2, 70
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
