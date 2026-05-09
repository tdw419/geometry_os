; DESCRIPTION: Renders a white box of size 20x40 starting at (347, 123).
; PLAN: r0=347(x), r1=123(y), r2=20(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 123
LDI r2, 20
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
