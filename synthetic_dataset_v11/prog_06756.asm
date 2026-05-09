; DESCRIPTION: Composite: . Then Renders a cyan line between points (175, 8) and (122, 46). Then Draws a black circle centered at (69, 81) with radius 51.
; PLAN: r0=175(x1), r1=8(y1), r2=122(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=69(x), r1=81(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (175, 8) and (122, 46).
; PLAN: r0=175(x1), r1=8(y1), r2=122(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 8
LDI r2, 122
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (69, 81) with radius 51.
; PLAN: r0=69(x), r1=81(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 81
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
