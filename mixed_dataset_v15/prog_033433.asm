; DESCRIPTION: Draws a magenta line from (482, 117) to (478, 179).
; PLAN: r0=482(x1), r1=117(y1), r2=478(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 117
LDI r2, 478
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
