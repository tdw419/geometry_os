; DESCRIPTION: Renders a white box of size 23x17 starting at (432, 206).
; PLAN: r0=432(x), r1=206(y), r2=23(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 206
LDI r2, 23
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
