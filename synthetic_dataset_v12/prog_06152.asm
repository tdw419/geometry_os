; DESCRIPTION: Places a blue 75x62 rectangle at position (10, 99).
; PLAN: r0=10(x), r1=99(y), r2=75(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 99
LDI r2, 75
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
