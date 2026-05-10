; DESCRIPTION: Places a white 11x115 box at position (101, 130).
; PLAN: r0=101(x), r1=130(y), r2=11(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 130
LDI r2, 11
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
