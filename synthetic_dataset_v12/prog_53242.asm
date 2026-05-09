; DESCRIPTION: Renders a yellow box of size 88x74 starting at (117, 108).
; PLAN: r0=117(x), r1=108(y), r2=88(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 108
LDI r2, 88
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
