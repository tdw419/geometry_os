; DESCRIPTION: Composite: . Then Renders a yellow disk with center (187, 192) and radius 51. Then Draws a blue line from (197, 96) to (14, 90).
; PLAN: r0=187(x), r1=192(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=197(x1), r1=96(y1), r2=14(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (187, 192) and radius 51.
; PLAN: r0=187(x), r1=192(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 192
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (197, 96) to (14, 90).
; PLAN: r0=197(x1), r1=96(y1), r2=14(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 96
LDI r2, 14
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
