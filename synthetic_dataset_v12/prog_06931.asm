; DESCRIPTION: Renders a white box of size 95x66 starting at (357, 9).
; PLAN: r0=357(x), r1=9(y), r2=95(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 9
LDI r2, 95
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
