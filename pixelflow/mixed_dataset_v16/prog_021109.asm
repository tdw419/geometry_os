; DESCRIPTION: Places a black 110x69 rectangle at position (244, 87).
; PLAN: r0=244(x), r1=87(y), r2=110(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 87
LDI r2, 110
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
