; DESCRIPTION: Renders a white box of size 74x90 starting at (81, 58).
; PLAN: r0=81(x), r1=58(y), r2=74(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 58
LDI r2, 74
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
