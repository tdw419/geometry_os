; DESCRIPTION: Places a purple 55x53 rectangle at position (236, 121).
; PLAN: r0=236(x), r1=121(y), r2=55(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 121
LDI r2, 55
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
