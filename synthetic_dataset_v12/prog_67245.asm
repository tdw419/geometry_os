; DESCRIPTION: Renders a white box of size 52x99 starting at (166, 87).
; PLAN: r0=166(x), r1=87(y), r2=52(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 87
LDI r2, 52
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
