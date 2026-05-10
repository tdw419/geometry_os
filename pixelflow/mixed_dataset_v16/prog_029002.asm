; DESCRIPTION: Places a white 14x112 rectangle at position (89, 6).
; PLAN: r0=89(x), r1=6(y), r2=14(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 6
LDI r2, 14
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
