; DESCRIPTION: Draws a purple line from (62, 247) to (468, 146).
; PLAN: r0=62(x1), r1=247(y1), r2=468(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 247
LDI r2, 468
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
