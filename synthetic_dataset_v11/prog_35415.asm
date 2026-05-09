; DESCRIPTION: Places a purple 101x91 rectangle at position (76, 70).
; PLAN: r0=76(x), r1=70(y), r2=101(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 70
LDI r2, 101
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
