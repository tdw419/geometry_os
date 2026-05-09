; DESCRIPTION: Places a purple 11x119 rectangle at position (157, 38).
; PLAN: r0=157(x), r1=38(y), r2=11(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 38
LDI r2, 11
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
