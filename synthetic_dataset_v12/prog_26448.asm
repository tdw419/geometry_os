; DESCRIPTION: Places a purple 108x17 rectangle at position (164, 176).
; PLAN: r0=164(x), r1=176(y), r2=108(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 176
LDI r2, 108
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
