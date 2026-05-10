; DESCRIPTION: Places a green 35x75 box at position (164, 72).
; PLAN: r0=164(x), r1=72(y), r2=35(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 72
LDI r2, 35
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
