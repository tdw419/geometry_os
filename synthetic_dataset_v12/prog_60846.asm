; DESCRIPTION: Renders a yellow box of size 93x74 starting at (14, 179).
; PLAN: r0=14(x), r1=179(y), r2=93(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 179
LDI r2, 93
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
