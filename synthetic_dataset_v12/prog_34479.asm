; DESCRIPTION: Places a purple 33x49 rectangle at position (142, 55).
; PLAN: r0=142(x), r1=55(y), r2=33(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 55
LDI r2, 33
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
