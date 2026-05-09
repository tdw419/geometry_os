; DESCRIPTION: Renders a blue box of size 29x30 starting at (282, 92).
; PLAN: r0=282(x), r1=92(y), r2=29(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 92
LDI r2, 29
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
