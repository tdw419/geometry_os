; DESCRIPTION: Composite: . Then Renders a purple line between points (173, 15) and (141, 87). Then Places a magenta circle of radius 79 at center (146, 148).
; PLAN: r0=173(x1), r1=15(y1), r2=141(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=148(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (173, 15) and (141, 87).
; PLAN: r0=173(x1), r1=15(y1), r2=141(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 15
LDI r2, 141
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 79 at center (146, 148).
; PLAN: r0=146(x), r1=148(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 148
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
