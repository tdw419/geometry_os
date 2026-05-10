; DESCRIPTION: Renders a purple box of size 54x105 starting at (350, 67).
; PLAN: r0=350(x), r1=67(y), r2=54(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 67
LDI r2, 54
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
