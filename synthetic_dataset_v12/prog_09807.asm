; DESCRIPTION: Places a blue 75x66 rectangle at position (333, 80).
; PLAN: r0=333(x), r1=80(y), r2=75(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 80
LDI r2, 75
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
