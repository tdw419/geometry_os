; DESCRIPTION: Places a black 115x113 rectangle at position (323, 110).
; PLAN: r0=323(x), r1=110(y), r2=115(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 110
LDI r2, 115
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
