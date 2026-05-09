; DESCRIPTION: Places a purple 116x46 rectangle at position (361, 194).
; PLAN: r0=361(x), r1=194(y), r2=116(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 194
LDI r2, 116
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
