; DESCRIPTION: Draws a green line from (489, 225) to (153, 69).
; PLAN: r0=489(x1), r1=225(y1), r2=153(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 225
LDI r2, 153
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
