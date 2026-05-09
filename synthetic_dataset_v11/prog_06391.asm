; DESCRIPTION: Places a white line segment connecting (44, 144) to (231, 135).
; PLAN: r0=44(x1), r1=144(y1), r2=231(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 144
LDI r2, 231
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
