; DESCRIPTION: Places a green 119x58 rectangle at position (163, 144).
; PLAN: r0=163(x), r1=144(y), r2=119(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 144
LDI r2, 119
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
