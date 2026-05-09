; DESCRIPTION: Renders a white box of size 101x93 starting at (36, 14).
; PLAN: r0=36(x), r1=14(y), r2=101(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 14
LDI r2, 101
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
