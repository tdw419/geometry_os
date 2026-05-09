; DESCRIPTION: Places a purple 29x70 rectangle at position (421, 185).
; PLAN: r0=421(x), r1=185(y), r2=29(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 185
LDI r2, 29
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
