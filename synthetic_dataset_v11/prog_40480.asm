; DESCRIPTION: Places a purple 108x76 rectangle at position (87, 159).
; PLAN: r0=87(x), r1=159(y), r2=108(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 159
LDI r2, 108
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
