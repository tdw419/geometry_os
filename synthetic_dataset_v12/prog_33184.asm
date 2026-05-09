; DESCRIPTION: Draws a magenta line from (482, 58) to (165, 140).
; PLAN: r0=482(x1), r1=58(y1), r2=165(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 58
LDI r2, 165
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
