; DESCRIPTION: Places a purple 76x116 rectangle at position (319, 101).
; PLAN: r0=319(x), r1=101(y), r2=76(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 101
LDI r2, 76
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
