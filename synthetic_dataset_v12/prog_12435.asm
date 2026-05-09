; DESCRIPTION: Renders a white box of size 47x117 starting at (119, 114).
; PLAN: r0=119(x), r1=114(y), r2=47(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 114
LDI r2, 47
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
