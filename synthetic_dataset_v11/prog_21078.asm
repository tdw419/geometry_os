; DESCRIPTION: Renders a blue box of size 63x79 starting at (126, 92).
; PLAN: r0=126(x), r1=92(y), r2=63(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 92
LDI r2, 63
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
