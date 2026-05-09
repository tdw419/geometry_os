; DESCRIPTION: Places a blue 43x72 rectangle at position (54, 145).
; PLAN: r0=54(x), r1=145(y), r2=43(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 145
LDI r2, 43
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
