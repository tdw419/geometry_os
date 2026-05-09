; DESCRIPTION: Renders a white box of size 75x80 starting at (216, 104).
; PLAN: r0=216(x), r1=104(y), r2=75(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 104
LDI r2, 75
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
