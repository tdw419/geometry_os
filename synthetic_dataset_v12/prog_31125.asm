; DESCRIPTION: Draws a purple line from (210, 131) to (303, 83).
; PLAN: r0=210(x1), r1=131(y1), r2=303(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 131
LDI r2, 303
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
