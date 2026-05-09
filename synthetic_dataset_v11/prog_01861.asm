; DESCRIPTION: Places a blue 105x12 rectangle at position (36, 70).
; PLAN: r0=36(x), r1=70(y), r2=105(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 70
LDI r2, 105
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
