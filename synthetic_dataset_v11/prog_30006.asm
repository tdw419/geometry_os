; DESCRIPTION: Draws a magenta line from (194, 171) to (210, 76).
; PLAN: r0=194(x1), r1=171(y1), r2=210(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 171
LDI r2, 210
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
