; DESCRIPTION: Places a blue 62x11 rectangle at position (89, 30).
; PLAN: r0=89(x), r1=30(y), r2=62(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 30
LDI r2, 62
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
