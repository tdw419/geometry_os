; DESCRIPTION: Places a black 35x98 rectangle at position (137, 54).
; PLAN: r0=137(x), r1=54(y), r2=35(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 54
LDI r2, 35
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
