; DESCRIPTION: Renders a white box of size 93x36 starting at (102, 158).
; PLAN: r0=102(x), r1=158(y), r2=93(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 158
LDI r2, 93
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
