; DESCRIPTION: Renders a purple box of size 103x108 starting at (282, 63).
; PLAN: r0=282(x), r1=63(y), r2=103(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 63
LDI r2, 103
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
