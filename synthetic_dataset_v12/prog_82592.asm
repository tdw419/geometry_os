; DESCRIPTION: Places a purple 108x95 rectangle at position (364, 98).
; PLAN: r0=364(x), r1=98(y), r2=108(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 98
LDI r2, 108
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
