; DESCRIPTION: Places a green 97x18 box at position (1, 200).
; PLAN: r0=1(x), r1=200(y), r2=97(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 200
LDI r2, 97
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
