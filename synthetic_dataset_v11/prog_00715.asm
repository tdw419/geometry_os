; DESCRIPTION: Places a purple 25x77 rectangle at position (97, 0).
; PLAN: r0=97(x), r1=0(y), r2=25(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 0
LDI r2, 25
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
