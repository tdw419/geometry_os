; DESCRIPTION: Composite: . Then Draws a green line from (117, 52) to (73, 253). Then Renders a blue disk with center (35, 37) and radius 27.
; PLAN: r0=117(x1), r1=52(y1), r2=73(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=35(x), r1=37(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (117, 52) to (73, 253).
; PLAN: r0=117(x1), r1=52(y1), r2=73(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 52
LDI r2, 73
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (35, 37) and radius 27.
; PLAN: r0=35(x), r1=37(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 37
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
