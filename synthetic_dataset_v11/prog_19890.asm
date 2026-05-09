; DESCRIPTION: Places a purple 53x60 rectangle at position (194, 54).
; PLAN: r0=194(x), r1=54(y), r2=53(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 54
LDI r2, 53
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
