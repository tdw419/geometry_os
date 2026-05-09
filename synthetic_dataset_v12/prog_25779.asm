; DESCRIPTION: Places a black 54x114 rectangle at position (347, 14).
; PLAN: r0=347(x), r1=14(y), r2=54(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 14
LDI r2, 54
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
