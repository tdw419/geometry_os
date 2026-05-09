; DESCRIPTION: Renders a white box of size 84x52 starting at (319, 118).
; PLAN: r0=319(x), r1=118(y), r2=84(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 118
LDI r2, 84
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
