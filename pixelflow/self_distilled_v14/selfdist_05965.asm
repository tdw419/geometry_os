; DESCRIPTION: Draws a purple line from (138, 171) to (124, 187).
; PLAN: r0=138(x1), r1=171(y1), r2=124(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 171
LDI r2, 124
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
