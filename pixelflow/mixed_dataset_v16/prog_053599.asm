; DESCRIPTION: Places a blue 30x76 rectangle at position (345, 20).
; PLAN: r0=345(x), r1=20(y), r2=30(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 20
LDI r2, 30
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
