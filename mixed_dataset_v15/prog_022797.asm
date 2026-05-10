; DESCRIPTION: Places a blue 73x108 rectangle at position (338, 135).
; PLAN: r0=338(x), r1=135(y), r2=73(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 135
LDI r2, 73
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
