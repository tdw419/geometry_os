; DESCRIPTION: Places a green 13x37 rectangle at position (106, 47).
; PLAN: r0=106(x), r1=47(y), r2=13(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 47
LDI r2, 13
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
