; DESCRIPTION: Places a white 78x91 box at position (364, 84).
; PLAN: r0=364(x), r1=84(y), r2=78(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 84
LDI r2, 78
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
