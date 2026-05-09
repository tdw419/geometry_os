; DESCRIPTION: Draws a yellow line from (400, 47) to (322, 57).
; PLAN: r0=400(x1), r1=47(y1), r2=322(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 47
LDI r2, 322
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
