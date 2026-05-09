; DESCRIPTION: Places a purple 97x43 rectangle at position (60, 81).
; PLAN: r0=60(x), r1=81(y), r2=97(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 81
LDI r2, 97
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
