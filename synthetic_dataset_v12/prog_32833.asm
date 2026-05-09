; DESCRIPTION: Places a blue 73x29 rectangle at position (232, 61).
; PLAN: r0=232(x), r1=61(y), r2=73(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 61
LDI r2, 73
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
