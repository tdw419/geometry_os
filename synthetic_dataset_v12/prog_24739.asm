; DESCRIPTION: Places a blue 101x54 rectangle at position (84, 173).
; PLAN: r0=84(x), r1=173(y), r2=101(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 173
LDI r2, 101
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
