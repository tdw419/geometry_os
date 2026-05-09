; DESCRIPTION: Places a magenta line segment connecting (161, 171) to (221, 248).
; PLAN: r0=161(x1), r1=171(y1), r2=221(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 171
LDI r2, 221
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
