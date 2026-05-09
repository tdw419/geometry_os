; DESCRIPTION: Places a black 31x70 rectangle at position (22, 121).
; PLAN: r0=22(x), r1=121(y), r2=31(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 121
LDI r2, 31
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
