; DESCRIPTION: Places a purple 49x47 rectangle at position (169, 178).
; PLAN: r0=169(x), r1=178(y), r2=49(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 178
LDI r2, 49
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
