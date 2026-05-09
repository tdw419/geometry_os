; DESCRIPTION: Places a purple 81x70 rectangle at position (53, 169).
; PLAN: r0=53(x), r1=169(y), r2=81(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 169
LDI r2, 81
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
