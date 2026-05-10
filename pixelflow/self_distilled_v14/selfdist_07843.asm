; DESCRIPTION: Places a green 71x66 box at position (250, 84).
; PLAN: r0=250(x), r1=84(y), r2=71(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 84
LDI r2, 71
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
