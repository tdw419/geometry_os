; DESCRIPTION: Places a purple line segment connecting (65, 113) to (207, 236).
; PLAN: r0=65(x1), r1=113(y1), r2=207(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 113
LDI r2, 207
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
