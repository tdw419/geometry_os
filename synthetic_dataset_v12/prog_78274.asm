; DESCRIPTION: Places a blue 63x84 rectangle at position (47, 120).
; PLAN: r0=47(x), r1=120(y), r2=63(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 120
LDI r2, 63
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
