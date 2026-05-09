; DESCRIPTION: Renders a blue box of size 33x77 starting at (68, 136).
; PLAN: r0=68(x), r1=136(y), r2=33(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 136
LDI r2, 33
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
