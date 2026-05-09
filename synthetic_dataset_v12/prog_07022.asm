; DESCRIPTION: Places a green 14x18 rectangle at position (163, 194).
; PLAN: r0=163(x), r1=194(y), r2=14(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 194
LDI r2, 14
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
