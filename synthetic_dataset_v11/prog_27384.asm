; DESCRIPTION: Renders a purple box of size 37x28 starting at (127, 63).
; PLAN: r0=127(x), r1=63(y), r2=37(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 63
LDI r2, 37
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
