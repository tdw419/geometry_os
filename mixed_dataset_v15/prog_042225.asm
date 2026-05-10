; DESCRIPTION: Renders a yellow box of size 74x28 starting at (321, 77).
; PLAN: r0=321(x), r1=77(y), r2=74(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 77
LDI r2, 74
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
