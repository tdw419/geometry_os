; DESCRIPTION: Renders a green rectangular region spanning 63 by 95 at (185, 37).
; PLAN: r0=185(x), r1=37(y), r2=63(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 37
LDI r2, 63
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
