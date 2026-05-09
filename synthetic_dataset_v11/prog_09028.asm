; DESCRIPTION: Places a green 110x60 rectangle at position (7, 122).
; PLAN: r0=7(x), r1=122(y), r2=110(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 122
LDI r2, 110
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
