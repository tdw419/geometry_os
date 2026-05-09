; DESCRIPTION: Places a black 37x30 rectangle at position (441, 217).
; PLAN: r0=441(x), r1=217(y), r2=37(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 217
LDI r2, 37
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
