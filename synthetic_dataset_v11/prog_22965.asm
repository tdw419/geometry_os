; DESCRIPTION: Renders a white box of size 109x39 starting at (6, 93).
; PLAN: r0=6(x), r1=93(y), r2=109(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 93
LDI r2, 109
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
