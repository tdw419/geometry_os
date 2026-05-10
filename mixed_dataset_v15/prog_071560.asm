; DESCRIPTION: Places a purple 29x73 box at position (167, 117).
; PLAN: r0=167(x), r1=117(y), r2=29(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 117
LDI r2, 29
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
