; DESCRIPTION: Renders a yellow box of size 71x115 starting at (375, 105).
; PLAN: r0=375(x), r1=105(y), r2=71(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 105
LDI r2, 71
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
