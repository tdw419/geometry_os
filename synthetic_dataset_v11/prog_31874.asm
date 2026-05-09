; DESCRIPTION: Places a blue 108x95 rectangle at position (89, 57).
; PLAN: r0=89(x), r1=57(y), r2=108(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 57
LDI r2, 108
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
