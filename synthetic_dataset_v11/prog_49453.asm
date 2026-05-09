; DESCRIPTION: Places a purple 119x60 rectangle at position (61, 192).
; PLAN: r0=61(x), r1=192(y), r2=119(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 192
LDI r2, 119
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
