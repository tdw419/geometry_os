; DESCRIPTION: Renders a white box of size 89x104 starting at (110, 2).
; PLAN: r0=110(x), r1=2(y), r2=89(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 2
LDI r2, 89
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
