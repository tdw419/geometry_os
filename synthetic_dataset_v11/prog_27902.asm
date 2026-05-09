; DESCRIPTION: Places a white 89x33 rectangle at position (31, 33).
; PLAN: r0=31(x), r1=33(y), r2=89(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 33
LDI r2, 89
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
