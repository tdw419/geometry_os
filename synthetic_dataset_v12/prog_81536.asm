; DESCRIPTION: Places a green 87x84 rectangle at position (184, 79).
; PLAN: r0=184(x), r1=79(y), r2=87(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 79
LDI r2, 87
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
