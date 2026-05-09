; DESCRIPTION: Draws a magenta line from (77, 241) to (0, 253).
; PLAN: r0=77(x1), r1=241(y1), r2=0(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 241
LDI r2, 0
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
