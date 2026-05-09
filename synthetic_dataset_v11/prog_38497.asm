; DESCRIPTION: Places a purple 92x73 rectangle at position (81, 149).
; PLAN: r0=81(x), r1=149(y), r2=92(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 149
LDI r2, 92
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
