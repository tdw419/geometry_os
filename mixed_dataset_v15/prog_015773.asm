; DESCRIPTION: Places a purple 107x57 rectangle at position (22, 20).
; PLAN: r0=22(x), r1=20(y), r2=107(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 20
LDI r2, 107
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
