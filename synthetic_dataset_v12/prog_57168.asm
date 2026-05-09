; DESCRIPTION: Places a black 37x78 rectangle at position (382, 132).
; PLAN: r0=382(x), r1=132(y), r2=37(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 132
LDI r2, 37
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
