; DESCRIPTION: Places a purple 20x16 rectangle at position (87, 168).
; PLAN: r0=87(x), r1=168(y), r2=20(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 168
LDI r2, 20
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
