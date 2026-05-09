; DESCRIPTION: Places a blue 59x11 rectangle at position (29, 157).
; PLAN: r0=29(x), r1=157(y), r2=59(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 157
LDI r2, 59
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
