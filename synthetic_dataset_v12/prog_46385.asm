; DESCRIPTION: Renders a yellow box of size 20x83 starting at (19, 115).
; PLAN: r0=19(x), r1=115(y), r2=20(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 115
LDI r2, 20
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
