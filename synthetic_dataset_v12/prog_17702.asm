; DESCRIPTION: Places a purple 101x40 rectangle at position (244, 165).
; PLAN: r0=244(x), r1=165(y), r2=101(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 165
LDI r2, 101
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
