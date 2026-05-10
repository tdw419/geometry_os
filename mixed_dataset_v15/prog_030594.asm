; DESCRIPTION: Draws a purple line from (130, 141) to (413, 187).
; PLAN: r0=130(x1), r1=141(y1), r2=413(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 141
LDI r2, 413
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
