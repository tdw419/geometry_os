; DESCRIPTION: Renders a blue box of size 104x120 starting at (388, 101).
; PLAN: r0=388(x), r1=101(y), r2=104(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 101
LDI r2, 104
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
