; DESCRIPTION: Places a black 119x93 rectangle at position (371, 50).
; PLAN: r0=371(x), r1=50(y), r2=119(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 50
LDI r2, 119
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
