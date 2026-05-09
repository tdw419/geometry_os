; DESCRIPTION: Composite: . Then Places a cyan circle of radius 41 at center (149, 136). Then Renders a magenta line between points (158, 156) and (82, 9).
; PLAN: r0=149(x), r1=136(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x1), r1=156(y1), r2=82(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 41 at center (149, 136).
; PLAN: r0=149(x), r1=136(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 136
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (158, 156) and (82, 9).
; PLAN: r0=158(x1), r1=156(y1), r2=82(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 156
LDI r2, 82
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
