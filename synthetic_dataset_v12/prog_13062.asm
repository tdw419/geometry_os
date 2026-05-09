; DESCRIPTION: Renders a yellow box of size 102x61 starting at (233, 85).
; PLAN: r0=233(x), r1=85(y), r2=102(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 85
LDI r2, 102
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
