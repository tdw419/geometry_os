; DESCRIPTION: Places a green 75x110 rectangle at position (110, 142).
; PLAN: r0=110(x), r1=142(y), r2=75(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 142
LDI r2, 75
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
