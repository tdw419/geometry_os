; DESCRIPTION: Places a green 119x40 rectangle at position (137, 194).
; PLAN: r0=137(x), r1=194(y), r2=119(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 194
LDI r2, 119
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
