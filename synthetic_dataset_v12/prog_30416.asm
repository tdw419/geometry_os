; DESCRIPTION: Places a black 70x110 rectangle at position (210, 35).
; PLAN: r0=210(x), r1=35(y), r2=70(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 35
LDI r2, 70
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
