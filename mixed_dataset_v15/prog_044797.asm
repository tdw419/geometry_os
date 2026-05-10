; DESCRIPTION: Places a blue 29x112 rectangle at position (355, 58).
; PLAN: r0=355(x), r1=58(y), r2=29(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 58
LDI r2, 29
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
