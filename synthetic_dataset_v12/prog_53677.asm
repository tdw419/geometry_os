; DESCRIPTION: Draws a magenta line from (22, 184) to (202, 138).
; PLAN: r0=22(x1), r1=184(y1), r2=202(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 184
LDI r2, 202
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
