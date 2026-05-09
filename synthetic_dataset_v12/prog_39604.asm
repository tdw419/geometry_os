; DESCRIPTION: Renders a white box of size 17x108 starting at (468, 3).
; PLAN: r0=468(x), r1=3(y), r2=17(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 3
LDI r2, 17
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
