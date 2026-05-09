; DESCRIPTION: Places a blue 119x105 rectangle at position (45, 78).
; PLAN: r0=45(x), r1=78(y), r2=119(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 78
LDI r2, 119
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
