; DESCRIPTION: Places a blue 84x11 rectangle at position (233, 135).
; PLAN: r0=233(x), r1=135(y), r2=84(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 135
LDI r2, 84
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
