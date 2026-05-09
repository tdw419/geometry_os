; DESCRIPTION: Renders a white box of size 81x44 starting at (94, 104).
; PLAN: r0=94(x), r1=104(y), r2=81(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 104
LDI r2, 81
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
