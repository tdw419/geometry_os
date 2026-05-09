; DESCRIPTION: Renders a yellow box of size 115x22 starting at (113, 49).
; PLAN: r0=113(x), r1=49(y), r2=115(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 49
LDI r2, 115
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
