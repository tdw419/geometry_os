; DESCRIPTION: Renders a magenta line between points (423, 157) and (7, 171).
; PLAN: r0=423(x1), r1=157(y1), r2=7(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 157
LDI r2, 7
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
