; DESCRIPTION: Places a purple 89x54 rectangle at position (397, 26).
; PLAN: r0=397(x), r1=26(y), r2=89(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 26
LDI r2, 89
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
