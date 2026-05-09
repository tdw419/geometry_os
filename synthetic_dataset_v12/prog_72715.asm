; DESCRIPTION: Places a magenta line segment connecting (303, 151) to (292, 141).
; PLAN: r0=303(x1), r1=151(y1), r2=292(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 151
LDI r2, 292
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
