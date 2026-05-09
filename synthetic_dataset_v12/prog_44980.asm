; DESCRIPTION: Renders a blue box of size 86x104 starting at (181, 138).
; PLAN: r0=181(x), r1=138(y), r2=86(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 138
LDI r2, 86
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
