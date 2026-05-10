; DESCRIPTION: Places a red 31x69 box at position (219, 49).
; PLAN: r0=219(x), r1=49(y), r2=31(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 49
LDI r2, 31
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
