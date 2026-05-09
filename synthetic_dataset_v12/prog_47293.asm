; DESCRIPTION: Places a black 96x69 rectangle at position (253, 74).
; PLAN: r0=253(x), r1=74(y), r2=96(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 74
LDI r2, 96
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
