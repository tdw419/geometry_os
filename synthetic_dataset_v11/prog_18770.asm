; DESCRIPTION: Composite: . Then Draws a yellow line from (165, 172) to (69, 225). Then Draws a purple circle centered at (195, 157) with radius 61.
; PLAN: r0=165(x1), r1=172(y1), r2=69(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=195(x), r1=157(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (165, 172) to (69, 225).
; PLAN: r0=165(x1), r1=172(y1), r2=69(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 172
LDI r2, 69
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (195, 157) with radius 61.
; PLAN: r0=195(x), r1=157(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 157
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
