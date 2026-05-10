; DESCRIPTION: Places a white 89x108 rectangle at position (334, 58).
; PLAN: r0=334(x), r1=58(y), r2=89(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 58
LDI r2, 89
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
