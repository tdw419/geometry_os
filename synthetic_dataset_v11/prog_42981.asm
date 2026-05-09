; DESCRIPTION: Renders a white box of size 118x27 starting at (20, 93).
; PLAN: r0=20(x), r1=93(y), r2=118(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 93
LDI r2, 118
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
