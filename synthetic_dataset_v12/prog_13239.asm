; DESCRIPTION: Renders a blue box of size 71x63 starting at (135, 99).
; PLAN: r0=135(x), r1=99(y), r2=71(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 99
LDI r2, 71
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
