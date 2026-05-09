; DESCRIPTION: Places a purple 83x103 rectangle at position (359, 138).
; PLAN: r0=359(x), r1=138(y), r2=83(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 138
LDI r2, 83
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
