; DESCRIPTION: Places a purple 76x96 rectangle at position (432, 30).
; PLAN: r0=432(x), r1=30(y), r2=76(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 30
LDI r2, 76
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
