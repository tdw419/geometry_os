; DESCRIPTION: Places a purple 76x110 rectangle at position (3, 84).
; PLAN: r0=3(x), r1=84(y), r2=76(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 84
LDI r2, 76
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
