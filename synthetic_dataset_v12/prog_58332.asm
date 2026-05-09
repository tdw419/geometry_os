; DESCRIPTION: Places a purple 31x48 rectangle at position (58, 190).
; PLAN: r0=58(x), r1=190(y), r2=31(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 190
LDI r2, 31
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
