; DESCRIPTION: Places a blue line segment connecting (140, 146) to (209, 18).
; PLAN: r0=140(x1), r1=146(y1), r2=209(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 146
LDI r2, 209
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
