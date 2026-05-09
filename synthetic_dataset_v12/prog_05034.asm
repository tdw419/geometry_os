; DESCRIPTION: Places a purple 53x49 rectangle at position (178, 50).
; PLAN: r0=178(x), r1=50(y), r2=53(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 50
LDI r2, 53
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
