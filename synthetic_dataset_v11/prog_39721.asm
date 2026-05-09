; DESCRIPTION: Places a yellow 71x15 rectangle at position (101, 35).
; PLAN: r0=101(x), r1=35(y), r2=71(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 35
LDI r2, 71
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
