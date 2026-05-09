; DESCRIPTION: Draws a magenta line from (129, 3) to (212, 27).
; PLAN: r0=129(x1), r1=3(y1), r2=212(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 3
LDI r2, 212
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
