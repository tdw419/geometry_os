; DESCRIPTION: Composite: . Then Draws a black line from (137, 179) to (111, 0). Then Renders a red disk with center (201, 42) and radius 40.
; PLAN: r0=137(x1), r1=179(y1), r2=111(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=201(x), r1=42(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (137, 179) to (111, 0).
; PLAN: r0=137(x1), r1=179(y1), r2=111(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 179
LDI r2, 111
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (201, 42) and radius 40.
; PLAN: r0=201(x), r1=42(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 42
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
