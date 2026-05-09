; DESCRIPTION: Draws a magenta line from (0, 178) to (202, 121).
; PLAN: r0=0(x1), r1=178(y1), r2=202(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 178
LDI r2, 202
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
