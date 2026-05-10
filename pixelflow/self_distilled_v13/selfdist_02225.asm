; DESCRIPTION: Places a white 91x97 box at position (334, 31).
; PLAN: r0=334(x), r1=31(y), r2=91(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 31
LDI r2, 91
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
