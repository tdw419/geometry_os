; DESCRIPTION: Renders a yellow box of size 19x115 starting at (33, 5).
; PLAN: r0=33(x), r1=5(y), r2=19(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 5
LDI r2, 19
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
