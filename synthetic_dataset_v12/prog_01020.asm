; DESCRIPTION: Places a yellow 49x41 rectangle at position (117, 145).
; PLAN: r0=117(x), r1=145(y), r2=49(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 145
LDI r2, 49
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
