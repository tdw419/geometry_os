; DESCRIPTION: Draws a green line from (174, 177) to (234, 245).
; PLAN: r0=174(x1), r1=177(y1), r2=234(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 177
LDI r2, 234
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
