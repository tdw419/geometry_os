; DESCRIPTION: Renders a white box of size 66x59 starting at (158, 93).
; PLAN: r0=158(x), r1=93(y), r2=66(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 93
LDI r2, 66
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
