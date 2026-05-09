; DESCRIPTION: Places a purple 108x21 rectangle at position (324, 90).
; PLAN: r0=324(x), r1=90(y), r2=108(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 90
LDI r2, 108
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
