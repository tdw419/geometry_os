; DESCRIPTION: Places a blue 105x110 rectangle at position (35, 95).
; PLAN: r0=35(x), r1=95(y), r2=105(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 95
LDI r2, 105
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
