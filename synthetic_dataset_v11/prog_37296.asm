; DESCRIPTION: Composite: . Then Draws a purple line from (32, 60) to (177, 18). Then Draws a red circle centered at (65, 138) with radius 49.
; PLAN: r0=32(x1), r1=60(y1), r2=177(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=65(x), r1=138(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (32, 60) to (177, 18).
; PLAN: r0=32(x1), r1=60(y1), r2=177(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 60
LDI r2, 177
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (65, 138) with radius 49.
; PLAN: r0=65(x), r1=138(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 138
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
