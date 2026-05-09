; DESCRIPTION: Draws a magenta line from (123, 129) to (177, 141).
; PLAN: r0=123(x1), r1=129(y1), r2=177(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 129
LDI r2, 177
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
