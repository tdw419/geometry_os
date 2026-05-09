; DESCRIPTION: Draws a magenta line from (405, 153) to (264, 85).
; PLAN: r0=405(x1), r1=153(y1), r2=264(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 153
LDI r2, 264
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
