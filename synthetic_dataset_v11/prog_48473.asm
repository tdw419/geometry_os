; DESCRIPTION: Renders a white box of size 81x99 starting at (61, 25).
; PLAN: r0=61(x), r1=25(y), r2=81(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 25
LDI r2, 81
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
