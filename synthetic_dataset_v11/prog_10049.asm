; DESCRIPTION: Renders a white box of size 99x106 starting at (90, 74).
; PLAN: r0=90(x), r1=74(y), r2=99(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 74
LDI r2, 99
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
