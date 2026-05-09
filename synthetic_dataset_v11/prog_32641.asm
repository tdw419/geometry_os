; DESCRIPTION: Places a yellow 109x101 rectangle at position (117, 137).
; PLAN: r0=117(x), r1=137(y), r2=109(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 137
LDI r2, 109
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
