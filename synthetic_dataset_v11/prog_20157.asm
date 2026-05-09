; DESCRIPTION: Places a black 40x37 rectangle at position (83, 77).
; PLAN: r0=83(x), r1=77(y), r2=40(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 77
LDI r2, 40
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
