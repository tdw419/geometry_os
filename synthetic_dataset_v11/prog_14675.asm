; DESCRIPTION: Places a purple 61x78 rectangle at position (194, 70).
; PLAN: r0=194(x), r1=70(y), r2=61(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 70
LDI r2, 61
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
