; DESCRIPTION: Places a white 31x89 rectangle at position (136, 163).
; PLAN: r0=136(x), r1=163(y), r2=31(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 163
LDI r2, 31
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
