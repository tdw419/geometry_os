; DESCRIPTION: Places a blue 25x42 rectangle at position (110, 80).
; PLAN: r0=110(x), r1=80(y), r2=25(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 80
LDI r2, 25
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
