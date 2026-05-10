; DESCRIPTION: Places a purple 73x105 box at position (124, 108).
; PLAN: r0=124(x), r1=108(y), r2=73(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 108
LDI r2, 73
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
