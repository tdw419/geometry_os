; DESCRIPTION: Places a purple line segment connecting (236, 202) to (342, 113).
; PLAN: r0=236(x1), r1=202(y1), r2=342(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 202
LDI r2, 342
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
