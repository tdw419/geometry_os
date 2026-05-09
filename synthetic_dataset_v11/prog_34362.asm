; DESCRIPTION: Composite: . Then Renders a white disk with center (164, 127) and radius 55. Then Draws a black line from (158, 133) to (114, 37).
; PLAN: r0=164(x), r1=127(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x1), r1=133(y1), r2=114(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (164, 127) and radius 55.
; PLAN: r0=164(x), r1=127(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 127
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (158, 133) to (114, 37).
; PLAN: r0=158(x1), r1=133(y1), r2=114(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 133
LDI r2, 114
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
