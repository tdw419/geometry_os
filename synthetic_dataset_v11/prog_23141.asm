; DESCRIPTION: Places a blue 35x38 rectangle at position (6, 181).
; PLAN: r0=6(x), r1=181(y), r2=35(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 181
LDI r2, 35
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
