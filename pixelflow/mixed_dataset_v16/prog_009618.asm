; DESCRIPTION: Places a purple 106x73 rectangle at position (49, 66).
; PLAN: r0=49(x), r1=66(y), r2=106(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 66
LDI r2, 106
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
