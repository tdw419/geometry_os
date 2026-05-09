; DESCRIPTION: Places a white 56x73 rectangle at position (89, 99).
; PLAN: r0=89(x), r1=99(y), r2=56(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 99
LDI r2, 56
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
