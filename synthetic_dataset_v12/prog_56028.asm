; DESCRIPTION: Draws a magenta line from (138, 14) to (125, 71).
; PLAN: r0=138(x1), r1=14(y1), r2=125(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 14
LDI r2, 125
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
