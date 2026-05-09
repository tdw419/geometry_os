; DESCRIPTION: Places a purple 54x62 rectangle at position (97, 108).
; PLAN: r0=97(x), r1=108(y), r2=54(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 108
LDI r2, 54
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
