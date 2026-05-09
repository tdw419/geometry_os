; DESCRIPTION: Places a purple 83x62 rectangle at position (268, 170).
; PLAN: r0=268(x), r1=170(y), r2=83(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 170
LDI r2, 83
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
