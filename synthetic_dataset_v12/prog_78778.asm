; DESCRIPTION: Places a blue 50x84 rectangle at position (74, 62).
; PLAN: r0=74(x), r1=62(y), r2=50(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 62
LDI r2, 50
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
