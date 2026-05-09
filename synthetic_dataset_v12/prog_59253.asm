; DESCRIPTION: Places a black 84x31 rectangle at position (141, 102).
; PLAN: r0=141(x), r1=102(y), r2=84(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 102
LDI r2, 84
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
