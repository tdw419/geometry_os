; DESCRIPTION: Draws a magenta line from (275, 77) to (321, 82).
; PLAN: r0=275(x1), r1=77(y1), r2=321(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 77
LDI r2, 321
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
