; DESCRIPTION: Renders a blue box of size 12x101 starting at (165, 117).
; PLAN: r0=165(x), r1=117(y), r2=12(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 117
LDI r2, 12
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
