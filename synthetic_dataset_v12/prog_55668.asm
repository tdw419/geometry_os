; DESCRIPTION: Places a blue 96x36 rectangle at position (255, 115).
; PLAN: r0=255(x), r1=115(y), r2=96(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 115
LDI r2, 96
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
