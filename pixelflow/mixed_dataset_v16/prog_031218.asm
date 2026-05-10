; DESCRIPTION: Places a blue line segment connecting (121, 209) to (504, 247).
; PLAN: r0=121(x1), r1=209(y1), r2=504(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 209
LDI r2, 504
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
