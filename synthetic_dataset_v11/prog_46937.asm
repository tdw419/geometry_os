; DESCRIPTION: Draws a magenta line from (125, 116) to (55, 225).
; PLAN: r0=125(x1), r1=116(y1), r2=55(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 116
LDI r2, 55
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
