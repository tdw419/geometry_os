; DESCRIPTION: Draws a magenta line from (305, 145) to (233, 91).
; PLAN: r0=305(x1), r1=145(y1), r2=233(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 145
LDI r2, 233
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
