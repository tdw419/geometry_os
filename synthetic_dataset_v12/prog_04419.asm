; DESCRIPTION: Places a black 84x119 rectangle at position (272, 61).
; PLAN: r0=272(x), r1=61(y), r2=84(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 61
LDI r2, 84
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
