; DESCRIPTION: Renders a red box of size 63x51 starting at (136, 156).
; PLAN: r0=136(x), r1=156(y), r2=63(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 156
LDI r2, 63
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
