; DESCRIPTION: Places a purple 57x38 box at position (66, 15).
; PLAN: r0=66(x), r1=15(y), r2=57(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 15
LDI r2, 57
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
