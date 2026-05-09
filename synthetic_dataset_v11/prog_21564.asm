; DESCRIPTION: Renders a white box of size 73x79 starting at (137, 35).
; PLAN: r0=137(x), r1=35(y), r2=73(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 35
LDI r2, 73
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
