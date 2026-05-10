; DESCRIPTION: Renders a white box of size 82x104 starting at (359, 93).
; PLAN: r0=359(x), r1=93(y), r2=82(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 93
LDI r2, 82
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
