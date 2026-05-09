; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (207, 23) to (96, 250). Then Places a blue circle of radius 59 at center (152, 95).
; PLAN: r0=207(x1), r1=23(y1), r2=96(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=152(x), r1=95(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta line segment connecting (207, 23) to (96, 250).
; PLAN: r0=207(x1), r1=23(y1), r2=96(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 23
LDI r2, 96
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 59 at center (152, 95).
; PLAN: r0=152(x), r1=95(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 95
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
