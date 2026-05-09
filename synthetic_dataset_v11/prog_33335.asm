; DESCRIPTION: Places a purple 72x119 rectangle at position (25, 34).
; PLAN: r0=25(x), r1=34(y), r2=72(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 34
LDI r2, 72
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
