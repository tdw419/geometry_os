; DESCRIPTION: Places a green 65x110 rectangle at position (286, 9).
; PLAN: r0=286(x), r1=9(y), r2=65(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 9
LDI r2, 65
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
