; DESCRIPTION: Renders a purple box of size 40x78 starting at (369, 117).
; PLAN: r0=369(x), r1=117(y), r2=40(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 117
LDI r2, 40
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
