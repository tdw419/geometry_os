; DESCRIPTION: Places a purple 75x24 rectangle at position (26, 192).
; PLAN: r0=26(x), r1=192(y), r2=75(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 192
LDI r2, 75
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
