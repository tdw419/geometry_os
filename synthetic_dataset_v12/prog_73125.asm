; DESCRIPTION: Places a purple 45x49 rectangle at position (134, 18).
; PLAN: r0=134(x), r1=18(y), r2=45(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 18
LDI r2, 45
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
