; DESCRIPTION: Places a blue 30x22 rectangle at position (255, 232).
; PLAN: r0=255(x), r1=232(y), r2=30(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 232
LDI r2, 30
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
