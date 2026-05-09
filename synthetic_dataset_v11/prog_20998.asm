; DESCRIPTION: Places a purple 61x71 rectangle at position (53, 90).
; PLAN: r0=53(x), r1=90(y), r2=61(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 90
LDI r2, 61
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
