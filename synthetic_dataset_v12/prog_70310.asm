; DESCRIPTION: Places a blue 10x29 rectangle at position (232, 166).
; PLAN: r0=232(x), r1=166(y), r2=10(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 166
LDI r2, 10
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
