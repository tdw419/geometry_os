; DESCRIPTION: Places a blue 93x49 rectangle at position (72, 199).
; PLAN: r0=72(x), r1=199(y), r2=93(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 199
LDI r2, 93
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
