; DESCRIPTION: Places a blue 119x110 rectangle at position (68, 72).
; PLAN: r0=68(x), r1=72(y), r2=119(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 72
LDI r2, 119
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
