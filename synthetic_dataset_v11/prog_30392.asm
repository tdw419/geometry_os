; DESCRIPTION: Composite: . Then Draws a orange line from (225, 227) to (116, 87). Then Draws a purple circle centered at (154, 112) with radius 65.
; PLAN: r0=225(x1), r1=227(y1), r2=116(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=154(x), r1=112(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (225, 227) to (116, 87).
; PLAN: r0=225(x1), r1=227(y1), r2=116(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 227
LDI r2, 116
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (154, 112) with radius 65.
; PLAN: r0=154(x), r1=112(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 112
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
