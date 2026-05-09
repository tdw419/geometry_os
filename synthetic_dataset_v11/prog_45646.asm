; DESCRIPTION: Places a black 73x110 rectangle at position (89, 107).
; PLAN: r0=89(x), r1=107(y), r2=73(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 107
LDI r2, 73
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
