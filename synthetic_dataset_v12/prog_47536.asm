; DESCRIPTION: Places a green 80x110 rectangle at position (145, 25).
; PLAN: r0=145(x), r1=25(y), r2=80(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 25
LDI r2, 80
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
