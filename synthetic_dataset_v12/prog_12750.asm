; DESCRIPTION: Places a blue 31x29 rectangle at position (274, 110).
; PLAN: r0=274(x), r1=110(y), r2=31(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 110
LDI r2, 31
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
