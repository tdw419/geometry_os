; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (177, 189) with radius 31. Then Draws a magenta line from (220, 35) to (151, 247).
; PLAN: r0=177(x), r1=189(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=220(x1), r1=35(y1), r2=151(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (177, 189) with radius 31.
; PLAN: r0=177(x), r1=189(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 189
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (220, 35) to (151, 247).
; PLAN: r0=220(x1), r1=35(y1), r2=151(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 35
LDI r2, 151
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
