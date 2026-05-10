; DESCRIPTION: Places a purple 101x55 rectangle at position (80, 22).
; PLAN: r0=80(x), r1=22(y), r2=101(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 22
LDI r2, 101
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
