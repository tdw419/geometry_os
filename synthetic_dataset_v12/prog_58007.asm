; DESCRIPTION: Places a purple 18x108 rectangle at position (118, 12).
; PLAN: r0=118(x), r1=12(y), r2=18(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 12
LDI r2, 18
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
