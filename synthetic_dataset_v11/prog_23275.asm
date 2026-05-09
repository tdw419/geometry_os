; DESCRIPTION: Composite: . Then Renders a red disk with center (189, 35) and radius 33. Then Draws a black line from (109, 4) to (85, 197).
; PLAN: r0=189(x), r1=35(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=109(x1), r1=4(y1), r2=85(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (189, 35) and radius 33.
; PLAN: r0=189(x), r1=35(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 35
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (109, 4) to (85, 197).
; PLAN: r0=109(x1), r1=4(y1), r2=85(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 4
LDI r2, 85
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
