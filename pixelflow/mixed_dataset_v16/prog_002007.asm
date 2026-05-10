; DESCRIPTION: Renders a magenta line between points (39, 102) and (301, 23).
; PLAN: r0=39(x1), r1=102(y1), r2=301(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 102
LDI r2, 301
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
