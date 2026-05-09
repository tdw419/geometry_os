; DESCRIPTION: Places a purple 20x22 rectangle at position (110, 76).
; PLAN: r0=110(x), r1=76(y), r2=20(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 76
LDI r2, 20
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
