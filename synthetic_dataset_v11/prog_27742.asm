; DESCRIPTION: Places a purple 45x102 rectangle at position (116, 142).
; PLAN: r0=116(x), r1=142(y), r2=45(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 142
LDI r2, 45
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
