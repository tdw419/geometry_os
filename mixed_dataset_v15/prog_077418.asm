; DESCRIPTION: Renders a blue box of size 86x63 starting at (79, 4).
; PLAN: r0=79(x), r1=4(y), r2=86(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 4
LDI r2, 86
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
