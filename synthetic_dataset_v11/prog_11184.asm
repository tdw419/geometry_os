; DESCRIPTION: Composite: . Then Draws a green circle centered at (112, 162) with radius 72. Then Renders a yellow line between points (175, 13) and (199, 154).
; PLAN: r0=112(x), r1=162(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x1), r1=13(y1), r2=199(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (112, 162) with radius 72.
; PLAN: r0=112(x), r1=162(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 162
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (175, 13) and (199, 154).
; PLAN: r0=175(x1), r1=13(y1), r2=199(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 13
LDI r2, 199
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
