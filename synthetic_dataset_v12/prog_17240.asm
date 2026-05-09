; DESCRIPTION: Places a purple 99x76 rectangle at position (32, 137).
; PLAN: r0=32(x), r1=137(y), r2=99(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 137
LDI r2, 99
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
