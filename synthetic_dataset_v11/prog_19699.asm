; DESCRIPTION: Renders a white box of size 28x119 starting at (68, 75).
; PLAN: r0=68(x), r1=75(y), r2=28(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 75
LDI r2, 28
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
