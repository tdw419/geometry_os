; DESCRIPTION: Places a blue 110x119 rectangle at position (120, 22).
; PLAN: r0=120(x), r1=22(y), r2=110(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 22
LDI r2, 110
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
