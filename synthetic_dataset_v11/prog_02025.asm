; DESCRIPTION: Composite: . Then Draws a orange line from (95, 195) to (211, 165). Then Renders a yellow disk with center (114, 69) and radius 68.
; PLAN: r0=95(x1), r1=195(y1), r2=211(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=114(x), r1=69(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (95, 195) to (211, 165).
; PLAN: r0=95(x1), r1=195(y1), r2=211(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 195
LDI r2, 211
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (114, 69) and radius 68.
; PLAN: r0=114(x), r1=69(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 69
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
