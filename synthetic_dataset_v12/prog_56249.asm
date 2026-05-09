; DESCRIPTION: Draws a magenta line from (110, 209) to (80, 138).
; PLAN: r0=110(x1), r1=209(y1), r2=80(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 209
LDI r2, 80
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
