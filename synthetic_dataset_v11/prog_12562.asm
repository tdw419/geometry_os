; DESCRIPTION: Places a purple 100x85 rectangle at position (17, 84).
; PLAN: r0=17(x), r1=84(y), r2=100(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 84
LDI r2, 100
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
