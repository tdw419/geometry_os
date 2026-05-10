; DESCRIPTION: Renders a yellow rectangular region spanning 18 by 35 at (193, 25).
; PLAN: r0=193(x), r1=25(y), r2=18(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 25
LDI r2, 18
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
