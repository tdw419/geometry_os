; DESCRIPTION: Places a black 37x73 rectangle at position (289, 110).
; PLAN: r0=289(x), r1=110(y), r2=37(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 110
LDI r2, 37
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
