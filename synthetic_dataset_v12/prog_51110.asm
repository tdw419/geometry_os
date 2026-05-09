; DESCRIPTION: Places a green 47x119 rectangle at position (272, 66).
; PLAN: r0=272(x), r1=66(y), r2=47(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 66
LDI r2, 47
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
