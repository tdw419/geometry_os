; DESCRIPTION: Composite: . Then Draws a black line from (250, 120) to (248, 76). Then Creates a green circular shape at (113, 74) with radius 34.
; PLAN: r0=250(x1), r1=120(y1), r2=248(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=113(x), r1=74(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (250, 120) to (248, 76).
; PLAN: r0=250(x1), r1=120(y1), r2=248(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 120
LDI r2, 248
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (113, 74) with radius 34.
; PLAN: r0=113(x), r1=74(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 74
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
