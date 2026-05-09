; DESCRIPTION: Places a blue line segment connecting (240, 178) to (102, 236).
; PLAN: r0=240(x1), r1=178(y1), r2=102(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 178
LDI r2, 102
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
