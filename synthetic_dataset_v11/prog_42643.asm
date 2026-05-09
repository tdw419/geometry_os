; DESCRIPTION: Composite: . Then Draws a red line from (14, 113) to (163, 187). Then Renders a orange disk with center (69, 148) and radius 50.
; PLAN: r0=14(x1), r1=113(y1), r2=163(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=69(x), r1=148(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (14, 113) to (163, 187).
; PLAN: r0=14(x1), r1=113(y1), r2=163(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 113
LDI r2, 163
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (69, 148) and radius 50.
; PLAN: r0=69(x), r1=148(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 148
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
