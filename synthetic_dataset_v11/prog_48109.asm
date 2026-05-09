; DESCRIPTION: Places a green 30x18 rectangle at position (166, 97).
; PLAN: r0=166(x), r1=97(y), r2=30(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 97
LDI r2, 30
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
