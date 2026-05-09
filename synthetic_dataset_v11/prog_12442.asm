; DESCRIPTION: Composite: . Then Draws a black line from (130, 138) to (200, 17). Then Places a magenta circle of radius 64 at center (182, 177).
; PLAN: r0=130(x1), r1=138(y1), r2=200(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=182(x), r1=177(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (130, 138) to (200, 17).
; PLAN: r0=130(x1), r1=138(y1), r2=200(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 138
LDI r2, 200
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 64 at center (182, 177).
; PLAN: r0=182(x), r1=177(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 177
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
