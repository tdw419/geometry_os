; DESCRIPTION: Places a blue line segment connecting (433, 247) to (499, 240).
; PLAN: r0=433(x1), r1=247(y1), r2=499(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 247
LDI r2, 499
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
