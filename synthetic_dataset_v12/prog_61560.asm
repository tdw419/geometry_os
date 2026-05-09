; DESCRIPTION: Draws a magenta line from (363, 10) to (286, 138).
; PLAN: r0=363(x1), r1=10(y1), r2=286(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 10
LDI r2, 286
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
