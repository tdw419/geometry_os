; DESCRIPTION: Renders a black box of size 77x91 starting at (285, 78).
; PLAN: r0=285(x), r1=78(y), r2=77(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 78
LDI r2, 77
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
