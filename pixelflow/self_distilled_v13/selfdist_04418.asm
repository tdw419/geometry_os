; DESCRIPTION: Draws a blue line from (25, 183) to (46, 57).
; PLAN: r0=25(x1), r1=183(y1), r2=46(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 183
LDI r2, 46
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
