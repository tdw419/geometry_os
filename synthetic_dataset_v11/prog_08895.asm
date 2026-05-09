; DESCRIPTION: Composite: . Then Places a magenta circle of radius 15 at center (77, 174). Then Renders a magenta line between points (76, 173) and (84, 141).
; PLAN: r0=77(x), r1=174(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=76(x1), r1=173(y1), r2=84(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 15 at center (77, 174).
; PLAN: r0=77(x), r1=174(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 174
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (76, 173) and (84, 141).
; PLAN: r0=76(x1), r1=173(y1), r2=84(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 173
LDI r2, 84
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
