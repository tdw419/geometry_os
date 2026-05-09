; DESCRIPTION: Places a black 110x17 rectangle at position (339, 79).
; PLAN: r0=339(x), r1=79(y), r2=110(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 79
LDI r2, 110
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
