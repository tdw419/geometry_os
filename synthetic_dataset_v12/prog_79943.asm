; DESCRIPTION: Places a blue line segment connecting (253, 209) to (170, 9).
; PLAN: r0=253(x1), r1=209(y1), r2=170(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 209
LDI r2, 170
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
