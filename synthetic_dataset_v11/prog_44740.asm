; DESCRIPTION: Renders a white box of size 44x117 starting at (80, 139).
; PLAN: r0=80(x), r1=139(y), r2=44(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 139
LDI r2, 44
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
