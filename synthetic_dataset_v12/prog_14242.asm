; DESCRIPTION: Places a blue 79x20 rectangle at position (87, 229).
; PLAN: r0=87(x), r1=229(y), r2=79(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 229
LDI r2, 79
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
