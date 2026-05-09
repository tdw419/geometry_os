; DESCRIPTION: Places a white line segment connecting (188, 194) to (4, 226).
; PLAN: r0=188(x1), r1=194(y1), r2=4(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 194
LDI r2, 4
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
