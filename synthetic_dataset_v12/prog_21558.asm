; DESCRIPTION: Renders a blue box of size 86x114 starting at (229, 48).
; PLAN: r0=229(x), r1=48(y), r2=86(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 48
LDI r2, 86
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
