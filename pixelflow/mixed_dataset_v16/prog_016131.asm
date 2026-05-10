; DESCRIPTION: Places a purple 73x45 rectangle at position (14, 141).
; PLAN: r0=14(x), r1=141(y), r2=73(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 141
LDI r2, 73
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
