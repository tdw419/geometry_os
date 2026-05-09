; DESCRIPTION: Composite: . Then Draws a red circle centered at (220, 150) with radius 14. Then Draws a blue line from (33, 99) to (51, 189).
; PLAN: r0=220(x), r1=150(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=33(x1), r1=99(y1), r2=51(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (220, 150) with radius 14.
; PLAN: r0=220(x), r1=150(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 150
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (33, 99) to (51, 189).
; PLAN: r0=33(x1), r1=99(y1), r2=51(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 99
LDI r2, 51
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
