; DESCRIPTION: Renders a yellow box of size 11x115 starting at (144, 49).
; PLAN: r0=144(x), r1=49(y), r2=11(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 49
LDI r2, 11
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
