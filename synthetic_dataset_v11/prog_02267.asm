; DESCRIPTION: Places a magenta line segment connecting (97, 146) to (98, 223).
; PLAN: r0=97(x1), r1=146(y1), r2=98(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 146
LDI r2, 98
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
