; DESCRIPTION: Renders a white box of size 71x75 starting at (1, 35).
; PLAN: r0=1(x), r1=35(y), r2=71(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 35
LDI r2, 71
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
