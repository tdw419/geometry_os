; DESCRIPTION: Places a blue 30x88 rectangle at position (329, 135).
; PLAN: r0=329(x), r1=135(y), r2=30(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 135
LDI r2, 30
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
