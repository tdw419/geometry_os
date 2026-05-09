; DESCRIPTION: Places a black 72x22 rectangle at position (117, 89).
; PLAN: r0=117(x), r1=89(y), r2=72(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 89
LDI r2, 72
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
