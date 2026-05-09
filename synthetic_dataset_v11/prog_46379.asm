; DESCRIPTION: Composite: . Then Draws a white circle centered at (177, 83) with radius 20. Then Places a green line segment connecting (175, 145) to (235, 181).
; PLAN: r0=177(x), r1=83(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x1), r1=145(y1), r2=235(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (177, 83) with radius 20.
; PLAN: r0=177(x), r1=83(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 83
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (175, 145) to (235, 181).
; PLAN: r0=175(x1), r1=145(y1), r2=235(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 145
LDI r2, 235
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
