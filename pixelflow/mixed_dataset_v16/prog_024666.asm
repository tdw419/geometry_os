; DESCRIPTION: Draws a magenta line from (290, 80) to (225, 237).
; PLAN: r0=290(x1), r1=80(y1), r2=225(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 80
LDI r2, 225
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
