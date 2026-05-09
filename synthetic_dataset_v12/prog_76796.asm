; DESCRIPTION: Places a blue 10x96 rectangle at position (19, 31).
; PLAN: r0=19(x), r1=31(y), r2=10(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 31
LDI r2, 10
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
