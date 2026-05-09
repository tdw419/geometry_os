; DESCRIPTION: Places a blue 88x100 rectangle at position (89, 48).
; PLAN: r0=89(x), r1=48(y), r2=88(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 48
LDI r2, 88
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
