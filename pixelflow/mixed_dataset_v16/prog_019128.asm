; DESCRIPTION: Creates a green rectangular region at (51, 63) spanning 95 by 88 pixels.
; PLAN: r0=51(x), r1=63(y), r2=95(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 63
LDI r2, 95
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
