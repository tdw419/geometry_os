; DESCRIPTION: Places a green 85x105 rectangle at position (11, 110).
; PLAN: r0=11(x), r1=110(y), r2=85(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 110
LDI r2, 85
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
