; DESCRIPTION: Renders a blue box of size 28x12 starting at (388, 163).
; PLAN: r0=388(x), r1=163(y), r2=28(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 163
LDI r2, 28
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
