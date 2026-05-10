; DESCRIPTION: Renders a blue box of size 94x29 starting at (235, 9).
; PLAN: r0=235(x), r1=9(y), r2=94(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 9
LDI r2, 94
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
