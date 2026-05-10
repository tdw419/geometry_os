; DESCRIPTION: Renders a white box of size 104x81 starting at (205, 3).
; PLAN: r0=205(x), r1=3(y), r2=104(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 3
LDI r2, 104
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
