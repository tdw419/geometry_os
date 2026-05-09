; DESCRIPTION: Places a blue 79x103 rectangle at position (19, 105).
; PLAN: r0=19(x), r1=105(y), r2=79(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 105
LDI r2, 79
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
