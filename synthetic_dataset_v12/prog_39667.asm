; DESCRIPTION: Places a purple 35x55 rectangle at position (273, 6).
; PLAN: r0=273(x), r1=6(y), r2=35(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 6
LDI r2, 35
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
