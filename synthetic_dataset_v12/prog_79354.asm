; DESCRIPTION: Renders a yellow box of size 115x99 starting at (167, 131).
; PLAN: r0=167(x), r1=131(y), r2=115(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 131
LDI r2, 115
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
