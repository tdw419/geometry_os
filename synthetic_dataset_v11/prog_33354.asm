; DESCRIPTION: Places a purple 31x46 rectangle at position (151, 25).
; PLAN: r0=151(x), r1=25(y), r2=31(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 25
LDI r2, 31
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
