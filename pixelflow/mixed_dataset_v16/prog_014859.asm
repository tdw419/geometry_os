; DESCRIPTION: Places a white 44x43 box at position (31, 35).
; PLAN: r0=31(x), r1=35(y), r2=44(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 35
LDI r2, 44
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
