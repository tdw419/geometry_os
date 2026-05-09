; DESCRIPTION: Places a blue 74x84 rectangle at position (87, 103).
; PLAN: r0=87(x), r1=103(y), r2=74(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 103
LDI r2, 74
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
