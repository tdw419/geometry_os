; DESCRIPTION: Places a black 115x105 rectangle at position (222, 13).
; PLAN: r0=222(x), r1=13(y), r2=115(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 13
LDI r2, 115
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
