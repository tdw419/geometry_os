; DESCRIPTION: Renders a magenta line between points (202, 65) and (15, 13).
; PLAN: r0=202(x1), r1=65(y1), r2=15(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 65
LDI r2, 15
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
