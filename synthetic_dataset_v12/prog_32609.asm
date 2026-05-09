; DESCRIPTION: Places a blue 95x62 rectangle at position (149, 117).
; PLAN: r0=149(x), r1=117(y), r2=95(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 117
LDI r2, 95
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
