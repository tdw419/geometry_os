; DESCRIPTION: Renders a yellow box of size 119x90 starting at (35, 165).
; PLAN: r0=35(x), r1=165(y), r2=119(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 165
LDI r2, 119
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
