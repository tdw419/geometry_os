; DESCRIPTION: Renders a white box of size 104x31 starting at (25, 93).
; PLAN: r0=25(x), r1=93(y), r2=104(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 93
LDI r2, 104
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
