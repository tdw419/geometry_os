; DESCRIPTION: Renders a yellow box of size 35x75 starting at (349, 114).
; PLAN: r0=349(x), r1=114(y), r2=35(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 114
LDI r2, 35
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
