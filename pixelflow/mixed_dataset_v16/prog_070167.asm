; DESCRIPTION: Places a blue 94x95 rectangle at position (258, 70).
; PLAN: r0=258(x), r1=70(y), r2=94(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 70
LDI r2, 94
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
