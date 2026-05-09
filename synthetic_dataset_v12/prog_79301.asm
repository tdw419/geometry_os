; DESCRIPTION: Places a purple 61x80 rectangle at position (13, 73).
; PLAN: r0=13(x), r1=73(y), r2=61(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 73
LDI r2, 61
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
