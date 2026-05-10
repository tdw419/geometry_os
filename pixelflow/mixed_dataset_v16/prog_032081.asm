; DESCRIPTION: Renders a purple box of size 67x75 starting at (63, 23).
; PLAN: r0=63(x), r1=23(y), r2=67(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 23
LDI r2, 67
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
