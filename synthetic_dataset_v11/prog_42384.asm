; DESCRIPTION: Places a green 110x100 rectangle at position (91, 90).
; PLAN: r0=91(x), r1=90(y), r2=110(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 90
LDI r2, 110
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
