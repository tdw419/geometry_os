; DESCRIPTION: Renders a white box of size 23x104 starting at (100, 40).
; PLAN: r0=100(x), r1=40(y), r2=23(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 40
LDI r2, 23
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
