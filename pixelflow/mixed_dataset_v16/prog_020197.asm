; DESCRIPTION: Places a blue line segment connecting (20, 46) to (275, 153).
; PLAN: r0=20(x1), r1=46(y1), r2=275(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 46
LDI r2, 275
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
