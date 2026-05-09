; DESCRIPTION: Places a purple 112x120 rectangle at position (27, 116).
; PLAN: r0=27(x), r1=116(y), r2=112(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 116
LDI r2, 112
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
