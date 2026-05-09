; DESCRIPTION: Renders a white box of size 86x35 starting at (2, 137).
; PLAN: r0=2(x), r1=137(y), r2=86(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 137
LDI r2, 86
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
