; DESCRIPTION: Composite: . Then Draws a white line from (108, 20) to (161, 155). Then Draws a red circle centered at (118, 193) with radius 44.
; PLAN: r0=108(x1), r1=20(y1), r2=161(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=193(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (108, 20) to (161, 155).
; PLAN: r0=108(x1), r1=20(y1), r2=161(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 20
LDI r2, 161
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (118, 193) with radius 44.
; PLAN: r0=118(x), r1=193(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 193
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
