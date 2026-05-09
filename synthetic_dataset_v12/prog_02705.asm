; DESCRIPTION: Places a purple 72x99 rectangle at position (232, 115).
; PLAN: r0=232(x), r1=115(y), r2=72(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 115
LDI r2, 72
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
