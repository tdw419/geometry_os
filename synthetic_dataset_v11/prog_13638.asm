; DESCRIPTION: Composite: . Then Draws a red line from (38, 211) to (79, 45). Then Renders a yellow disk with center (38, 76) and radius 19.
; PLAN: r0=38(x1), r1=211(y1), r2=79(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=38(x), r1=76(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (38, 211) to (79, 45).
; PLAN: r0=38(x1), r1=211(y1), r2=79(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 211
LDI r2, 79
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (38, 76) and radius 19.
; PLAN: r0=38(x), r1=76(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 76
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
