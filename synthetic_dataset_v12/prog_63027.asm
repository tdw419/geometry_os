; DESCRIPTION: Draws a magenta line from (321, 16) to (14, 2).
; PLAN: r0=321(x1), r1=16(y1), r2=14(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 16
LDI r2, 14
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
