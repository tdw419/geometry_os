; DESCRIPTION: Places a purple 31x57 rectangle at position (55, 0).
; PLAN: r0=55(x), r1=0(y), r2=31(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 0
LDI r2, 31
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
