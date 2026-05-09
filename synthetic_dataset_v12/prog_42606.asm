; DESCRIPTION: Renders a white box of size 78x37 starting at (1, 23).
; PLAN: r0=1(x), r1=23(y), r2=78(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 23
LDI r2, 78
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
