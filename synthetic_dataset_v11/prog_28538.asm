; DESCRIPTION: Renders a white box of size 100x66 starting at (5, 186).
; PLAN: r0=5(x), r1=186(y), r2=100(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 186
LDI r2, 100
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
