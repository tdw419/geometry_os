; DESCRIPTION: Places a purple 68x15 rectangle at position (76, 40).
; PLAN: r0=76(x), r1=40(y), r2=68(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 40
LDI r2, 68
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
