; DESCRIPTION: Places a purple 64x33 rectangle at position (331, 133).
; PLAN: r0=331(x), r1=133(y), r2=64(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 133
LDI r2, 64
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
