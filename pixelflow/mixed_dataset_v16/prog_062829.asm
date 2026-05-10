; DESCRIPTION: Places a white 93x58 box at position (137, 138).
; PLAN: r0=137(x), r1=138(y), r2=93(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 138
LDI r2, 93
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
