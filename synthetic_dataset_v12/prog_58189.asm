; DESCRIPTION: Places a purple 76x88 rectangle at position (217, 156).
; PLAN: r0=217(x), r1=156(y), r2=76(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 156
LDI r2, 76
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
