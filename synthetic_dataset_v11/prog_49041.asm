; DESCRIPTION: Places a blue 119x14 rectangle at position (8, 218).
; PLAN: r0=8(x), r1=218(y), r2=119(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 218
LDI r2, 119
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
