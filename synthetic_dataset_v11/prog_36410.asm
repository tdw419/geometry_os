; DESCRIPTION: Places a blue 115x66 rectangle at position (20, 14).
; PLAN: r0=20(x), r1=14(y), r2=115(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 14
LDI r2, 115
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
