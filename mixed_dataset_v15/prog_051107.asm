; DESCRIPTION: Renders a blue box of size 87x88 starting at (235, 81).
; PLAN: r0=235(x), r1=81(y), r2=87(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 81
LDI r2, 87
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
