; DESCRIPTION: Composite: Renders a green line between points (91, 20) and (134, 131) then Renders a yellow box of size 60x118 starting at (120, 114).
; PLAN: r0=91(x1), r1=20(y1), r2=134(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=114(y), r7=60(width), r8=118(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 20
LDI r2, 134
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 114
LDI r7, 60
LDI r8, 118
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
