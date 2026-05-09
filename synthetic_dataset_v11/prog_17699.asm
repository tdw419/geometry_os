; DESCRIPTION: Composite: . Then Draws a blue circle centered at (46, 206) with radius 43. Then Renders a green line between points (65, 160) and (242, 202).
; PLAN: r0=46(x), r1=206(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=65(x1), r1=160(y1), r2=242(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (46, 206) with radius 43.
; PLAN: r0=46(x), r1=206(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 206
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (65, 160) and (242, 202).
; PLAN: r0=65(x1), r1=160(y1), r2=242(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 160
LDI r2, 242
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
