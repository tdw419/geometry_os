; DESCRIPTION: Places a blue 73x88 rectangle at position (285, 128).
; PLAN: r0=285(x), r1=128(y), r2=73(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 128
LDI r2, 73
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
