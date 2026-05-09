; DESCRIPTION: Draws a magenta line from (7, 176) to (28, 138).
; PLAN: r0=7(x1), r1=176(y1), r2=28(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 176
LDI r2, 28
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
