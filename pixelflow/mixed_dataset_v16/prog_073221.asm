; DESCRIPTION: Renders a white box of size 93x106 starting at (54, 52).
; PLAN: r0=54(x), r1=52(y), r2=93(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 52
LDI r2, 93
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
