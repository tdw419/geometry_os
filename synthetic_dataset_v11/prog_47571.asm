; DESCRIPTION: Renders a yellow box of size 92x74 starting at (26, 40).
; PLAN: r0=26(x), r1=40(y), r2=92(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 40
LDI r2, 92
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
