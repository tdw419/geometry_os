; DESCRIPTION: Composite: . Then Renders a blue disk with center (94, 127) and radius 80. Then Draws a red line from (208, 98) to (249, 222).
; PLAN: r0=94(x), r1=127(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=208(x1), r1=98(y1), r2=249(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (94, 127) and radius 80.
; PLAN: r0=94(x), r1=127(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 127
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (208, 98) to (249, 222).
; PLAN: r0=208(x1), r1=98(y1), r2=249(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 98
LDI r2, 249
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
