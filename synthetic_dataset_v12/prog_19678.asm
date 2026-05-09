; DESCRIPTION: Places a green 66x89 rectangle at position (56, 39).
; PLAN: r0=56(x), r1=39(y), r2=66(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 39
LDI r2, 66
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
