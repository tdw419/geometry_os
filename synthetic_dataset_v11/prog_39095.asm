; DESCRIPTION: Composite: . Then Places a blue line segment connecting (35, 220) to (207, 235). Then Places a purple circle of radius 55 at center (70, 163).
; PLAN: r0=35(x1), r1=220(y1), r2=207(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=163(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (35, 220) to (207, 235).
; PLAN: r0=35(x1), r1=220(y1), r2=207(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 220
LDI r2, 207
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 55 at center (70, 163).
; PLAN: r0=70(x), r1=163(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 163
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
