; DESCRIPTION: Renders a blue box of size 101x45 starting at (364, 72).
; PLAN: r0=364(x), r1=72(y), r2=101(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 72
LDI r2, 101
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
