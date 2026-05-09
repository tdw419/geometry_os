; DESCRIPTION: Composite: . Then Places a magenta circle of radius 61 at center (164, 72). Then Renders a red line between points (38, 156) and (2, 138).
; PLAN: r0=164(x), r1=72(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=38(x1), r1=156(y1), r2=2(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 61 at center (164, 72).
; PLAN: r0=164(x), r1=72(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 72
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (38, 156) and (2, 138).
; PLAN: r0=38(x1), r1=156(y1), r2=2(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 156
LDI r2, 2
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
