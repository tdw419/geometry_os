; DESCRIPTION: Places a blue line segment connecting (277, 166) to (300, 171).
; PLAN: r0=277(x1), r1=166(y1), r2=300(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 166
LDI r2, 300
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
