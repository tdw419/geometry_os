; DESCRIPTION: Places a blue 10x49 rectangle at position (216, 115).
; PLAN: r0=216(x), r1=115(y), r2=10(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 115
LDI r2, 10
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
