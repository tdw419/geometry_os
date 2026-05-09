; DESCRIPTION: Places a purple 66x32 rectangle at position (272, 130).
; PLAN: r0=272(x), r1=130(y), r2=66(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 130
LDI r2, 66
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
