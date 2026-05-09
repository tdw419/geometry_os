; DESCRIPTION: Renders a white box of size 52x47 starting at (119, 10).
; PLAN: r0=119(x), r1=10(y), r2=52(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 10
LDI r2, 52
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
