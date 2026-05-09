; DESCRIPTION: Places a purple 92x84 rectangle at position (74, 116).
; PLAN: r0=74(x), r1=116(y), r2=92(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 116
LDI r2, 92
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
