; DESCRIPTION: Composite: . Then Places a magenta circle of radius 67 at center (146, 147). Then Renders a red line between points (188, 90) and (243, 156).
; PLAN: r0=146(x), r1=147(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=188(x1), r1=90(y1), r2=243(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 67 at center (146, 147).
; PLAN: r0=146(x), r1=147(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 147
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (188, 90) and (243, 156).
; PLAN: r0=188(x1), r1=90(y1), r2=243(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 90
LDI r2, 243
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
