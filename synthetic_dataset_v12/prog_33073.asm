; DESCRIPTION: Places a purple 72x102 rectangle at position (274, 15).
; PLAN: r0=274(x), r1=15(y), r2=72(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 15
LDI r2, 72
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
