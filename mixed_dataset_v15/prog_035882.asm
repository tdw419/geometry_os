; DESCRIPTION: Places a white 110x11 box at position (331, 63).
; PLAN: r0=331(x), r1=63(y), r2=110(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 63
LDI r2, 110
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
