; DESCRIPTION: Places a white 75x78 box at position (18, 112).
; PLAN: r0=18(x), r1=112(y), r2=75(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 112
LDI r2, 75
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
