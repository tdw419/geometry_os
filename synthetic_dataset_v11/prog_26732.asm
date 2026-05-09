; DESCRIPTION: Places a purple 99x55 rectangle at position (13, 16).
; PLAN: r0=13(x), r1=16(y), r2=99(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 16
LDI r2, 99
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
