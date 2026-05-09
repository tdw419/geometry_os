; DESCRIPTION: Places a yellow 110x23 rectangle at position (188, 98).
; PLAN: r0=188(x), r1=98(y), r2=110(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 98
LDI r2, 110
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
