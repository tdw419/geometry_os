; DESCRIPTION: Draws a magenta line from (158, 196) to (174, 214).
; PLAN: r0=158(x1), r1=196(y1), r2=174(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 196
LDI r2, 174
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
