; DESCRIPTION: Renders a white box of size 94x118 starting at (38, 79).
; PLAN: r0=38(x), r1=79(y), r2=94(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 79
LDI r2, 94
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
