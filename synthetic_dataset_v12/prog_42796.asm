; DESCRIPTION: Places a purple 55x82 rectangle at position (142, 81).
; PLAN: r0=142(x), r1=81(y), r2=55(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 81
LDI r2, 55
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
