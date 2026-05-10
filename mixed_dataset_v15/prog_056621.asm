; DESCRIPTION: Places a blue 35x119 rectangle at position (393, 135).
; PLAN: r0=393(x), r1=135(y), r2=35(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 135
LDI r2, 35
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
