; DESCRIPTION: Places a blue 59x66 rectangle at position (58, 148).
; PLAN: r0=58(x), r1=148(y), r2=59(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 148
LDI r2, 59
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
