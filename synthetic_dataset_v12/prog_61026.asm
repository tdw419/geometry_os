; DESCRIPTION: Places a blue 78x79 rectangle at position (142, 18).
; PLAN: r0=142(x), r1=18(y), r2=78(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 18
LDI r2, 78
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
