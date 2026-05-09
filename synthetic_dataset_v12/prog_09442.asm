; DESCRIPTION: Draws a magenta line from (250, 220) to (400, 187).
; PLAN: r0=250(x1), r1=220(y1), r2=400(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 220
LDI r2, 400
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
