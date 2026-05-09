; DESCRIPTION: Renders a white box of size 81x57 starting at (0, 89).
; PLAN: r0=0(x), r1=89(y), r2=81(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 89
LDI r2, 81
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
