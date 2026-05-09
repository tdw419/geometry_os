; DESCRIPTION: Draws a magenta line from (39, 245) to (369, 234).
; PLAN: r0=39(x1), r1=245(y1), r2=369(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 245
LDI r2, 369
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
