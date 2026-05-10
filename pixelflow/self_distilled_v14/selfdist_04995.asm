; DESCRIPTION: Places a purple 57x41 box at position (293, 152).
; PLAN: r0=293(x), r1=152(y), r2=57(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 152
LDI r2, 57
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
