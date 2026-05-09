; DESCRIPTION: Composite: . Then Draws a yellow line from (167, 112) to (195, 171). Then Draws a green circle centered at (45, 203) with radius 23.
; PLAN: r0=167(x1), r1=112(y1), r2=195(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=45(x), r1=203(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (167, 112) to (195, 171).
; PLAN: r0=167(x1), r1=112(y1), r2=195(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 112
LDI r2, 195
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (45, 203) with radius 23.
; PLAN: r0=45(x), r1=203(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 203
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
