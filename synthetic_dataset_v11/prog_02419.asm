; DESCRIPTION: Composite: . Then Draws a green line from (204, 217) to (40, 131). Then Draws a red circle centered at (160, 151) with radius 60.
; PLAN: r0=204(x1), r1=217(y1), r2=40(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=160(x), r1=151(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (204, 217) to (40, 131).
; PLAN: r0=204(x1), r1=217(y1), r2=40(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 217
LDI r2, 40
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (160, 151) with radius 60.
; PLAN: r0=160(x), r1=151(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 151
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
