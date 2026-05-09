; DESCRIPTION: Composite: . Then Renders a green disk with center (191, 171) and radius 63. Then Draws a black line from (236, 41) to (202, 218).
; PLAN: r0=191(x), r1=171(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=236(x1), r1=41(y1), r2=202(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (191, 171) and radius 63.
; PLAN: r0=191(x), r1=171(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 171
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (236, 41) to (202, 218).
; PLAN: r0=236(x1), r1=41(y1), r2=202(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 41
LDI r2, 202
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
