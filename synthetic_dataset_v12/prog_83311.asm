; DESCRIPTION: Places a purple 77x33 rectangle at position (389, 61).
; PLAN: r0=389(x), r1=61(y), r2=77(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 61
LDI r2, 77
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
