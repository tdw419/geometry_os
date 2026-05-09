; DESCRIPTION: Places a purple 94x62 rectangle at position (85, 94).
; PLAN: r0=85(x), r1=94(y), r2=94(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 94
LDI r2, 94
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
