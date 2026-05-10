; DESCRIPTION: Places a white 115x58 box at position (143, 149).
; PLAN: r0=143(x), r1=149(y), r2=115(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 149
LDI r2, 115
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
