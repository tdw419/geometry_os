; DESCRIPTION: Places a purple 13x76 box at position (266, 56).
; PLAN: r0=266(x), r1=56(y), r2=13(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 56
LDI r2, 13
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
