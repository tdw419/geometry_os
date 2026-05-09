; DESCRIPTION: Places a black 115x17 rectangle at position (4, 33).
; PLAN: r0=4(x), r1=33(y), r2=115(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 33
LDI r2, 115
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
