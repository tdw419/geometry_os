; DESCRIPTION: Renders a yellow box of size 36x17 starting at (47, 124).
; PLAN: r0=47(x), r1=124(y), r2=36(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 124
LDI r2, 36
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
