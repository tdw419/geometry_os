; DESCRIPTION: Places a blue 119x26 rectangle at position (308, 207).
; PLAN: r0=308(x), r1=207(y), r2=119(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 207
LDI r2, 119
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
