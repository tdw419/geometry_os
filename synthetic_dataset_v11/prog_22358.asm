; DESCRIPTION: Renders a green box of size 101x104 starting at (142, 136).
; PLAN: r0=142(x), r1=136(y), r2=101(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 136
LDI r2, 101
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
