; DESCRIPTION: Places a purple 83x40 rectangle at position (101, 76).
; PLAN: r0=101(x), r1=76(y), r2=83(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 76
LDI r2, 83
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
