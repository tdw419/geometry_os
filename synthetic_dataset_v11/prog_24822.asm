; DESCRIPTION: Draws a magenta line from (14, 129) to (102, 226).
; PLAN: r0=14(x1), r1=129(y1), r2=102(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 129
LDI r2, 102
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
