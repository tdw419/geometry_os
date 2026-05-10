; DESCRIPTION: Places a blue 93x101 rectangle at position (142, 80).
; PLAN: r0=142(x), r1=80(y), r2=93(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 80
LDI r2, 93
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
