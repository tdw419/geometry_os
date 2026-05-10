; DESCRIPTION: Places a purple 66x58 box at position (16, 72).
; PLAN: r0=16(x), r1=72(y), r2=66(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 72
LDI r2, 66
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
