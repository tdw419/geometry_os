; DESCRIPTION: Places a green 117x17 box at position (250, 140).
; PLAN: r0=250(x), r1=140(y), r2=117(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 140
LDI r2, 117
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
