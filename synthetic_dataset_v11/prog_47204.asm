; DESCRIPTION: Composite: . Then Renders a yellow box of size 44x94 starting at (166, 129). Then Places a red line segment connecting (115, 94) to (110, 71).
; PLAN: r0=166(x), r1=129(y), r2=44(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=115(x1), r1=94(y1), r2=110(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 44x94 starting at (166, 129).
; PLAN: r0=166(x), r1=129(y), r2=44(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 129
LDI r2, 44
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (115, 94) to (110, 71).
; PLAN: r0=115(x1), r1=94(y1), r2=110(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 94
LDI r2, 110
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
