; DESCRIPTION: Renders a white box of size 52x68 starting at (145, 102).
; PLAN: r0=145(x), r1=102(y), r2=52(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 102
LDI r2, 52
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
