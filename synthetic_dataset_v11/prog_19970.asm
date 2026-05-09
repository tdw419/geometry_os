; DESCRIPTION: Places a black 22x117 rectangle at position (47, 137).
; PLAN: r0=47(x), r1=137(y), r2=22(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 137
LDI r2, 22
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
