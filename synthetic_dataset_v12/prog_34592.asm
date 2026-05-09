; DESCRIPTION: Places a red line segment connecting (451, 152) to (236, 197).
; PLAN: r0=451(x1), r1=152(y1), r2=236(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 152
LDI r2, 236
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
