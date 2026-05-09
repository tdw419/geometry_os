; DESCRIPTION: Places a magenta line segment connecting (223, 25) to (275, 226).
; PLAN: r0=223(x1), r1=25(y1), r2=275(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 25
LDI r2, 275
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
