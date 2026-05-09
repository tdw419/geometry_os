; DESCRIPTION: Renders a purple box of size 67x40 starting at (264, 113).
; PLAN: r0=264(x), r1=113(y), r2=67(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 113
LDI r2, 67
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
