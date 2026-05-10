; DESCRIPTION: Places a purple 12x83 rectangle at position (249, 158).
; PLAN: r0=249(x), r1=158(y), r2=12(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 158
LDI r2, 12
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
