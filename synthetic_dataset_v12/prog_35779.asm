; DESCRIPTION: Renders a green box of size 59x37 starting at (147, 180).
; PLAN: r0=147(x), r1=180(y), r2=59(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 180
LDI r2, 59
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
