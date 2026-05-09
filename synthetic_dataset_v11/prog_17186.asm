; DESCRIPTION: Composite: . Then Draws a white line from (38, 166) to (204, 148). Then Draws a blue circle centered at (148, 212) with radius 44.
; PLAN: r0=38(x1), r1=166(y1), r2=204(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=148(x), r1=212(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (38, 166) to (204, 148).
; PLAN: r0=38(x1), r1=166(y1), r2=204(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 166
LDI r2, 204
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (148, 212) with radius 44.
; PLAN: r0=148(x), r1=212(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 212
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
