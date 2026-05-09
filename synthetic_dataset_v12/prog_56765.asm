; DESCRIPTION: Places a green 31x14 rectangle at position (66, 130).
; PLAN: r0=66(x), r1=130(y), r2=31(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 130
LDI r2, 31
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
