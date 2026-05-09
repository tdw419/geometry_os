; DESCRIPTION: Renders a blue box of size 88x86 starting at (145, 132).
; PLAN: r0=145(x), r1=132(y), r2=88(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 132
LDI r2, 88
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
