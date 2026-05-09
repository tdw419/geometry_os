; DESCRIPTION: Renders a white box of size 102x78 starting at (84, 84).
; PLAN: r0=84(x), r1=84(y), r2=102(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 84
LDI r2, 102
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
