; DESCRIPTION: Renders a yellow line segment connecting (391, 197) to (311, 69).
; PLAN: r0=391(x1), r1=197(y1), r2=311(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 197
LDI r2, 311
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
