; DESCRIPTION: Renders a purple box of size 108x49 starting at (63, 13).
; PLAN: r0=63(x), r1=13(y), r2=108(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 13
LDI r2, 108
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
