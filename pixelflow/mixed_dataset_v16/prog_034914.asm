; DESCRIPTION: Places a purple 70x26 box at position (244, 48).
; PLAN: r0=244(x), r1=48(y), r2=70(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 48
LDI r2, 70
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
