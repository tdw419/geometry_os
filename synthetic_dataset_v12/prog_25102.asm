; DESCRIPTION: Places a yellow 11x114 rectangle at position (35, 60).
; PLAN: r0=35(x), r1=60(y), r2=11(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 60
LDI r2, 11
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
