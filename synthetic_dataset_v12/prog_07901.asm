; DESCRIPTION: Draws a magenta line from (44, 31) to (108, 57).
; PLAN: r0=44(x1), r1=31(y1), r2=108(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 31
LDI r2, 108
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
