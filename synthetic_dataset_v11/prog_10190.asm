; DESCRIPTION: Composite: . Then Draws a green line from (14, 247) to (205, 156). Then Renders a purple disk with center (132, 66) and radius 28.
; PLAN: r0=14(x1), r1=247(y1), r2=205(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=132(x), r1=66(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (14, 247) to (205, 156).
; PLAN: r0=14(x1), r1=247(y1), r2=205(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 247
LDI r2, 205
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (132, 66) and radius 28.
; PLAN: r0=132(x), r1=66(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 66
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
