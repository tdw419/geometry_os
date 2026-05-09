; DESCRIPTION: Composite: . Then Creates a green circular shape at (92, 58) with radius 51. Then Draws a blue line from (149, 227) to (173, 244).
; PLAN: r0=92(x), r1=58(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=149(x1), r1=227(y1), r2=173(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (92, 58) with radius 51.
; PLAN: r0=92(x), r1=58(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 58
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (149, 227) to (173, 244).
; PLAN: r0=149(x1), r1=227(y1), r2=173(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 227
LDI r2, 173
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
