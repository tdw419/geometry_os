; DESCRIPTION: Places a purple 31x77 rectangle at position (350, 100).
; PLAN: r0=350(x), r1=100(y), r2=31(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 100
LDI r2, 31
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
