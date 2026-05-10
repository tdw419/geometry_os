; DESCRIPTION: Draws a purple line from (313, 225) to (199, 38).
; PLAN: r0=313(x1), r1=225(y1), r2=199(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 225
LDI r2, 199
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
