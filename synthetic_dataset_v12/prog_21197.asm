; DESCRIPTION: Renders a yellow box of size 115x100 starting at (44, 70).
; PLAN: r0=44(x), r1=70(y), r2=115(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 70
LDI r2, 115
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
