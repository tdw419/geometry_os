; DESCRIPTION: Composite: . Then Draws a yellow line from (217, 79) to (165, 241). Then Places a green circle of radius 56 at center (130, 154).
; PLAN: r0=217(x1), r1=79(y1), r2=165(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=130(x), r1=154(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (217, 79) to (165, 241).
; PLAN: r0=217(x1), r1=79(y1), r2=165(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 79
LDI r2, 165
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 56 at center (130, 154).
; PLAN: r0=130(x), r1=154(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 154
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
