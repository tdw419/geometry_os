; DESCRIPTION: Draws a magenta line from (34, 183) to (217, 177).
; PLAN: r0=34(x1), r1=183(y1), r2=217(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 183
LDI r2, 217
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
