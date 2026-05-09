; DESCRIPTION: Places a green 80x119 rectangle at position (166, 106).
; PLAN: r0=166(x), r1=106(y), r2=80(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 106
LDI r2, 80
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
