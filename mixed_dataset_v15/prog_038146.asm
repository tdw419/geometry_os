; DESCRIPTION: Draws a magenta line from (473, 143) to (44, 138).
; PLAN: r0=473(x1), r1=143(y1), r2=44(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 143
LDI r2, 44
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
