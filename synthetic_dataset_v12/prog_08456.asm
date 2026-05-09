; DESCRIPTION: Renders a blue box of size 58x30 starting at (124, 117).
; PLAN: r0=124(x), r1=117(y), r2=58(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 117
LDI r2, 58
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
