; DESCRIPTION: Renders a white box of size 115x20 starting at (84, 18).
; PLAN: r0=84(x), r1=18(y), r2=115(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 18
LDI r2, 115
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
