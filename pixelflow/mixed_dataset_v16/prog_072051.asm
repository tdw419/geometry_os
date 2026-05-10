; DESCRIPTION: Places a green 37x110 rectangle at position (332, 77).
; PLAN: r0=332(x), r1=77(y), r2=37(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 77
LDI r2, 37
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
