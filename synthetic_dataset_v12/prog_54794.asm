; DESCRIPTION: Places a purple 30x73 rectangle at position (193, 167).
; PLAN: r0=193(x), r1=167(y), r2=30(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 167
LDI r2, 30
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
