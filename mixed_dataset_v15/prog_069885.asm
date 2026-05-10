; DESCRIPTION: Places a blue 35x70 rectangle at position (150, 45).
; PLAN: r0=150(x), r1=45(y), r2=35(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 45
LDI r2, 35
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
