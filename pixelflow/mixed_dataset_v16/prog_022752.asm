; DESCRIPTION: Renders a yellow box of size 71x93 starting at (153, 77).
; PLAN: r0=153(x), r1=77(y), r2=71(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 77
LDI r2, 71
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
