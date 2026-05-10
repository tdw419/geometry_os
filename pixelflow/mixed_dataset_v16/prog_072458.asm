; DESCRIPTION: Places a blue 105x114 rectangle at position (369, 0).
; PLAN: r0=369(x), r1=0(y), r2=105(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 0
LDI r2, 105
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
