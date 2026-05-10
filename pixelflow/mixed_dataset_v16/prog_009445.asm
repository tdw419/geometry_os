; DESCRIPTION: Places a blue line segment connecting (360, 96) to (208, 202).
; PLAN: r0=360(x1), r1=96(y1), r2=208(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 96
LDI r2, 208
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
