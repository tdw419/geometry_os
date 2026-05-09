; DESCRIPTION: Composite: . Then Renders a black line between points (22, 235) and (206, 126). Then Draws a green circle centered at (63, 220) with radius 18.
; PLAN: r0=22(x1), r1=235(y1), r2=206(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=63(x), r1=220(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (22, 235) and (206, 126).
; PLAN: r0=22(x1), r1=235(y1), r2=206(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 235
LDI r2, 206
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (63, 220) with radius 18.
; PLAN: r0=63(x), r1=220(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 220
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
