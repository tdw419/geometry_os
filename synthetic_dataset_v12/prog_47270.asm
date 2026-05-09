; DESCRIPTION: Places a purple 61x35 rectangle at position (325, 170).
; PLAN: r0=325(x), r1=170(y), r2=61(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 170
LDI r2, 61
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
