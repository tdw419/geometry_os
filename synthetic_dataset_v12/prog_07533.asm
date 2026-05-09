; DESCRIPTION: Renders a yellow box of size 22x94 starting at (342, 89).
; PLAN: r0=342(x), r1=89(y), r2=22(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 89
LDI r2, 22
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
