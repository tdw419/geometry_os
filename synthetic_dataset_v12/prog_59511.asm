; DESCRIPTION: Places a green 65x78 rectangle at position (382, 66).
; PLAN: r0=382(x), r1=66(y), r2=65(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 66
LDI r2, 65
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
