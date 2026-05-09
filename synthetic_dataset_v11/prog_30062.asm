; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (76, 140) with radius 67. Then Renders a black line between points (137, 195) and (107, 47).
; PLAN: r0=76(x), r1=140(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=137(x1), r1=195(y1), r2=107(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (76, 140) with radius 67.
; PLAN: r0=76(x), r1=140(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 140
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (137, 195) and (107, 47).
; PLAN: r0=137(x1), r1=195(y1), r2=107(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 195
LDI r2, 107
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
