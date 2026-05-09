; DESCRIPTION: Renders a magenta line between points (261, 72) and (313, 100).
; PLAN: r0=261(x1), r1=72(y1), r2=313(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 72
LDI r2, 313
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
