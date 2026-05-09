; DESCRIPTION: Renders a magenta line between points (400, 212) and (492, 46).
; PLAN: r0=400(x1), r1=212(y1), r2=492(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 212
LDI r2, 492
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
