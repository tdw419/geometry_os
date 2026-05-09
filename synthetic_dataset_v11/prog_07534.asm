; DESCRIPTION: Renders a blue box of size 15x70 starting at (191, 169).
; PLAN: r0=191(x), r1=169(y), r2=15(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 169
LDI r2, 15
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
