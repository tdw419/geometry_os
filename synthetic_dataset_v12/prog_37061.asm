; DESCRIPTION: Renders a white box of size 84x19 starting at (390, 24).
; PLAN: r0=390(x), r1=24(y), r2=84(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 24
LDI r2, 84
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
