; DESCRIPTION: Places a purple line segment connecting (187, 209) to (92, 96).
; PLAN: r0=187(x1), r1=209(y1), r2=92(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 209
LDI r2, 92
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
