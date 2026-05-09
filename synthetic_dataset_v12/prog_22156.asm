; DESCRIPTION: Places a white 11x89 rectangle at position (221, 99).
; PLAN: r0=221(x), r1=99(y), r2=11(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 99
LDI r2, 11
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
