; DESCRIPTION: Renders a purple box of size 119x67 starting at (277, 57).
; PLAN: r0=277(x), r1=57(y), r2=119(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 57
LDI r2, 119
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
