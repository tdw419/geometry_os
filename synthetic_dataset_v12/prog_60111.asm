; DESCRIPTION: Places a blue 79x60 rectangle at position (334, 87).
; PLAN: r0=334(x), r1=87(y), r2=79(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 87
LDI r2, 79
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
