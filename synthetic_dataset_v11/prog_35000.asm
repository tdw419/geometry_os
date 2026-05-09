; DESCRIPTION: Draws a magenta line from (124, 35) to (13, 255).
; PLAN: r0=124(x1), r1=35(y1), r2=13(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 35
LDI r2, 13
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
