; DESCRIPTION: Renders a blue box of size 90x78 starting at (123, 169).
; PLAN: r0=123(x), r1=169(y), r2=90(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 169
LDI r2, 90
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
