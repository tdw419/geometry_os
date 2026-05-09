; DESCRIPTION: Composite: . Then Renders a yellow disk with center (194, 143) and radius 43. Then Draws a magenta line from (171, 225) to (155, 209).
; PLAN: r0=194(x), r1=143(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=171(x1), r1=225(y1), r2=155(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (194, 143) and radius 43.
; PLAN: r0=194(x), r1=143(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 143
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (171, 225) to (155, 209).
; PLAN: r0=171(x1), r1=225(y1), r2=155(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 225
LDI r2, 155
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
