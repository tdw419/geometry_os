; DESCRIPTION: Renders a magenta line between points (301, 28) and (492, 99).
; PLAN: r0=301(x1), r1=28(y1), r2=492(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 28
LDI r2, 492
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
