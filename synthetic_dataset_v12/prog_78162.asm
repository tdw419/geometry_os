; DESCRIPTION: Renders a white box of size 89x96 starting at (144, 29).
; PLAN: r0=144(x), r1=29(y), r2=89(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 29
LDI r2, 89
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
