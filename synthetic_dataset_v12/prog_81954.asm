; DESCRIPTION: Places a blue 38x76 rectangle at position (115, 70).
; PLAN: r0=115(x), r1=70(y), r2=38(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 70
LDI r2, 38
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
