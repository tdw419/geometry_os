; DESCRIPTION: Places a white 105x49 rectangle at position (97, 33).
; PLAN: r0=97(x), r1=33(y), r2=105(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 33
LDI r2, 105
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
