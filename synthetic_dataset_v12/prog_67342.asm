; DESCRIPTION: Places a purple 97x61 rectangle at position (97, 33).
; PLAN: r0=97(x), r1=33(y), r2=97(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 33
LDI r2, 97
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
