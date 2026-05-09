; DESCRIPTION: Renders a blue box of size 54x63 starting at (77, 167).
; PLAN: r0=77(x), r1=167(y), r2=54(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 167
LDI r2, 54
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
