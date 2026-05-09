; DESCRIPTION: Renders a black box of size 11x98 starting at (285, 34).
; PLAN: r0=285(x), r1=34(y), r2=11(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 34
LDI r2, 11
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
