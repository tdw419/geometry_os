; DESCRIPTION: Places a purple 97x112 rectangle at position (393, 14).
; PLAN: r0=393(x), r1=14(y), r2=97(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 14
LDI r2, 97
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
