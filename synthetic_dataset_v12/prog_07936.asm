; DESCRIPTION: Renders a blue box of size 72x16 starting at (314, 101).
; PLAN: r0=314(x), r1=101(y), r2=72(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 101
LDI r2, 72
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
