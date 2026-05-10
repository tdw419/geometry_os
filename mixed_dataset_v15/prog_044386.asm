; DESCRIPTION: Places a red line segment connecting (356, 66) to (382, 135).
; PLAN: r0=356(x1), r1=66(y1), r2=382(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 66
LDI r2, 382
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
